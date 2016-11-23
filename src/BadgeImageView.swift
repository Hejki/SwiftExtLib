//
//  BadgeImageView.swift
//  eLisa
//
//  Created by Hejki on 27.08.15.
//  Copyright © 2015 DoxoLogic s.r.o. All rights reserved.
//

#if os(iOS)
import UIKit

class BadgeLabel: UILabel {
    var insets: UIEdgeInsets?
    
    override func drawTextInRect(rect: CGRect) {
        if let insets = insets {
            super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
        } else {
            super.drawTextInRect(rect)
        }
    }
    
    override func textRectForBounds(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        if let insets = insets {
            var rect = super.textRectForBounds(UIEdgeInsetsInsetRect(bounds, insets), limitedToNumberOfLines: numberOfLines)
            
            rect.origin.x -= insets.left
            rect.origin.y -= insets.top
            rect.size.width += (insets.left + insets.right)
            rect.size.height += (insets.top + insets.bottom)
            return rect
        }
        return super.textRectForBounds(bounds, limitedToNumberOfLines: numberOfLines)
    }
}

class SwiftBadge: UILabel {
    var defaultInsets = CGSize(width: 2, height: 2)
    var actualInsets = CGSize()
    
    convenience init() {
        self.init(frame: CGRect())
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.backgroundColor = UIColor.redColor().CGColor
        textColor = UIColor.whiteColor()
        
        // Shadow
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 0.5
        layer.shadowColor = UIColor.blackColor().CGColor
    }
    
    // Add custom insets
    // --------------------
    override func textRectForBounds(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let rect = super.textRectForBounds(bounds, limitedToNumberOfLines: numberOfLines)
        
        actualInsets = defaultInsets
        let rectWithDefaultInsets = CGRectInset(rect, -actualInsets.width, -actualInsets.height)
        
        // If width is less than height
        // Adjust the width insets to make it look round
        if rectWithDefaultInsets.width < rectWithDefaultInsets.height {
            actualInsets.width = (rectWithDefaultInsets.height - rect.width) / 2
        }
        
        return CGRectInset(rect, -actualInsets.width, -actualInsets.height)
    }
    
    override func drawTextInRect(rect: CGRect) {
        
        layer.cornerRadius = rect.height / 2
        
        let insets = UIEdgeInsets(
            top: actualInsets.height,
            left: actualInsets.width,
            bottom: actualInsets.height,
            right: actualInsets.width)
        
        let rectWithoutInsets = UIEdgeInsetsInsetRect(rect, insets)
        
        super.drawTextInRect(rectWithoutInsets)
    }
}

@IBDesignable
class BadgeImageView: UIView {
    @IBInspectable var badge: String? {
        didSet {
            badgeLabel?.text = badge
        }
    }
    @IBInspectable var image: UIImage?
    var badgeLabel: SwiftBadge!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        badgeLabel = SwiftBadge()
        badgeLabel.textColor = UIColor.whiteColor()
        badgeLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        addSubview(badgeLabel)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
////        badgeLabel.frame = frame
//    }
//    
//    override func drawRect(rect: CGRect) {
//                let ctx = UIGraphicsGetCurrentContext()
//        
//        CGContextSaveGState(ctx)
//        let round = UIBezierPath(roundedRect: rect, cornerRadius: rect.width/2)
//        
//        round.addClip()
//        image?.drawInRect(rect)
//        CGContextRestoreGState(ctx)
//        
////        if let badgeText = badge {
////            let text = badgeText as NSString
////            let size = CGSize(width: rect.width, height: CGFloat.max)
////            let font = UIFont.systemFontOfSize(UIFont.systemFontSize())
////            let paragraph = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
////            
////            paragraph.alignment = .Center
////            paragraph.headIndent = 20
////            paragraph.tailIndent = 12
////            
////            let textAttr = [
////                NSFontAttributeName: font,
////                NSForegroundColorAttributeName: UIColor.whiteColor(),
////                NSBackgroundColorAttributeName: UIColor.redColor(),
////                NSParagraphStyleAttributeName: paragraph
////            ]
////            
////            var textRect = text.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: textAttr, context: nil)
////            
//////            textRect.size.width = textRect.width + 10
////            text.drawInRect(textRect, withAttributes: textAttr)
////
////        }
//        
////        if let badgeText = badge {
////            let label = BadgeLabel(frame: rect)
////            
////            label.text = badgeText
////            label.font = UIFont.systemFontOfSize(UIFont.systemFontSize())
////            label.textColor = UIColor.blackColor()
////            label.layer.masksToBounds = true
////            label.layer.cornerRadius = 2
////            label.backgroundColor = UIColor.redColor()
//////            label.insets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
////            label.sizeToFit()
////            
////            let labelRect = CGRect(x: rect.width - label.frame.width, y: 0, width: label.frame.width, height: label.frame.height)
//////            let labelRect = CGRect(x: 0, y: 0, width: 10, height: 100)
//////            label.drawViewHierarchyInRect(rect, afterScreenUpdates: true)
//////        label.drawRect(rect)
////        }
//        
//        super.drawRect(rect)
//    }
}
#endif