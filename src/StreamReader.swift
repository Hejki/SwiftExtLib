//
// HejkiSwiftCore
//
// Copyright (c) 2015-2016 Hejki
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation

open class StreamReader {

    let encoding: String.Encoding
    let chunkSize: Int

    var fileHandle: FileHandle!
    let buffer: NSMutableData!
    let delimData: Data!
    var atEof: Bool = false

    public init(url: URL, delimiter: String = "\n", encoding: String.Encoding = .utf8, chunkSize: Int = 4096) throws {
        self.chunkSize = chunkSize
        self.encoding = encoding

        do {
            let fileHandle = try FileHandle(forReadingFrom: url)
            if let delimData = delimiter.data(using: encoding),
                let buffer = NSMutableData(capacity: chunkSize) {
                self.fileHandle = fileHandle
                self.delimData = delimData
                self.buffer = buffer
            } else {
                throw HSCAppError.cannotReadFile(url: url).nsError
            }
        }
    }

    deinit {
        self.close()
    }

    /// Return next line, or nil on EOF.
    open func nextLine() -> String? {
        precondition(fileHandle != nil, "Attempt to read from closed file")

        if atEof {
            return nil
        }

        // Read data chunks from file until a line delimiter is found:
        var range = buffer.range(of: delimData, options: [], in: NSMakeRange(0, buffer.length))
        while range.location == NSNotFound {
            let tmpData = fileHandle.readData(ofLength: chunkSize)
            if tmpData.count == 0 {
                // EOF or read error.
                atEof = true
                if buffer.length > 0 {
                    // Buffer contains last line in file (not terminated by delimiter).
                    let line = String(data: buffer as Data, encoding: encoding)

                    buffer.length = 0
                    return line
                }
                // No more lines.
                return nil
            }
            buffer.append(tmpData)
            range = buffer.range(of: delimData, options: [], in: NSMakeRange(0, buffer.length))
        }

        // Convert complete line (excluding the delimiter) to a string:
        let line = String(data: buffer.subdata(with: NSMakeRange(0, range.location)),
            encoding: encoding)
        // Remove line (and the delimiter) from the buffer:
        buffer.replaceBytes(in: NSMakeRange(0, range.location + range.length), withBytes: nil, length: 0)

        return line
    }

    /// Start reading from the beginning of file.
    open func rewind() -> Void {
        fileHandle.seek(toFileOffset: 0)
        buffer.length = 0
        atEof = false
    }

    /// Close the underlying file. No reading must be done after calling this method.
    open func close() -> Void {
        fileHandle?.closeFile()
        fileHandle = nil
    }
}
