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

public protocol AppError: Error {
    var domain: String { get }
    var code: Int { get }
    var description: String { get }
    
    var recoverySuggestion: String? { get }
}

//MARK: - NSError extension for AppError
public extension AppError {
    
    var domain: String {
        return Bundle.main.bundleIdentifier!
    }
    
    var recoverySuggestion: String? {
        return nil
    }
    
    var nsError: NSError {
        var dict = [
            NSLocalizedDescriptionKey: description,
        ]
        
        if let suggestion = recoverySuggestion {
            dict[NSLocalizedRecoverySuggestionErrorKey] = suggestion
        }
        
        return NSError(domain: domain, code: code, userInfo: dict)
    }
}

//MARK: - Hejki Swift Core framework errors
public enum HSCAppError: AppError {
    case invalidSegueIdentifier(identifier: String?)
    case cannotReadFile(url: URL)
    
    public var domain: String {
        #if os(macOS)
            return "org.hejki.macos.hejki-swift-core"
        #else
            return "org.hejkiios.hejki-swift-core"
        #endif
    }
    
    public var code: Int {
        switch self {
        case .invalidSegueIdentifier: return 0
        case .cannotReadFile: return 1
        }
    }
    
    public var description: String {
        switch self {
        case .invalidSegueIdentifier(let identifier):
            let identifier = identifier ?? "<nil>"
            return "Invalid segue identifier \(identifier)"
        case .cannotReadFile(let url):
            return "Cannot read file at url \(url.path)"
        }
    }
}
