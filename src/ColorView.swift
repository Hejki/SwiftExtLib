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

import AppKit

/// Wiew with spefified colored background.
@IBDesignable
public class ColorView: NSView {

    /// Color of bacgkround for this view
    @IBInspectable
    var backgroundColor: NSColor = .controlBackgroundColor
    
    @IBInspectable
    var backgroundColor2: NSColor?
    
    @IBInspectable
    var gradientAngle: Float = 0

    override public func draw(_ dirtyRect: NSRect) {
        if let secondColor = backgroundColor2 { // draw gradient
            let gradient = NSGradient(colors: [backgroundColor, secondColor])
            let bezierPath = NSBezierPath(rect: self.bounds)
            
            gradient?.draw(in: bezierPath, angle: CGFloat(gradientAngle))
        } else {
            backgroundColor.setFill()
            NSRectFill(dirtyRect)
        }
    }
}
