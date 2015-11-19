//
//  SuchSwift.swift
//  SuchSwift
//
//  Created by Jonathan Hersh on 6/4/14.
//  Copyright (c) 2014 JH. All rights reserved.
//

import UIKit
import ObjectiveC

private let SuchAnimateTime: NSTimeInterval = 0.95
private let SuchAnimateInterval: NSTimeInterval = 0.25

private var suchTimerKey: UInt8 = 0

private extension CGFloat {
    static func SuchRandomColorFloat() -> CGFloat {
        return self.init(10 + arc4random_uniform(165)) / 255.0
    }
}

private extension UIColor {
    class func SuchRandomColor() -> UIColor {
        return self.init(red: CGFloat.SuchRandomColorFloat(),
            green: CGFloat.SuchRandomColorFloat(),
            blue: CGFloat.SuchRandomColorFloat(),
            alpha: 1.0)
    }
}

private extension NSAttributedString {
    class func SuchAttributedString(text: String) -> NSAttributedString {
        let attributes = [
            NSFontAttributeName : UIFont(name: "Comic Sans MS", size: 16)!,
            NSForegroundColorAttributeName : UIColor.SuchRandomColor()
        ]

        return self.init(string: text, attributes: attributes)
    }
}

extension UILabel {
    private static let text = ["wow", "wow", "wow", "so swift", "such xcode", "very 8", "much recompile", "so moscone", "very federighi"]

    private class func SuchRandomText() -> String {
        return text[Int(arc4random_uniform(UInt32(text.count)))]
    }

    class func SuchRandomLabel() -> UILabel {
        let label = UILabel()
        label.attributedText = NSAttributedString.SuchAttributedString(SuchRandomText())
        label.backgroundColor = UIColor.clearColor()
        label.sizeToFit()

        return label
    }
}

extension UIView {
    
    private var timer: NSTimer? {
        get {
            return objc_getAssociatedObject(self, &suchTimerKey) as? NSTimer
        }
        set {
            objc_setAssociatedObject(self, &suchTimerKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    public var isWow: Bool {
        return timer?.valid ?? false
    }

    public func SuchStartWow() {
        
        guard !isWow else {
            return
        }

        let timer = NSTimer(timeInterval: SuchAnimateInterval,
            target: self,
            selector: Selector("SuchAddLabel"),
            userInfo: nil,
            repeats: true)

        self.timer = timer

        NSOperationQueue.mainQueue().addOperationWithBlock {
            NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        }
    }
    
    public func SuchStopWow() {
        
        guard isWow else {
            return
        }

        NSOperationQueue.mainQueue().addOperationWithBlock {
            self.timer?.invalidate()
            self.timer = nil
        }
    }

    func SuchAddLabel() {
        
        let label = UILabel.SuchRandomLabel()

        addSubview(label)

        let origin = CGPoint(x: 30 + CGFloat(arc4random_uniform(UInt32(frame.size.width - 90))),
            y: CGFloat(arc4random_uniform(UInt32(frame.size.height - 30))))

        label.frame = CGRectMake(origin.x,
            origin.y,
            label.frame.size.width,
            label.frame.size.height)

        let animations = {
            label.alpha = 0.0
            label.transform = CGAffineTransformMakeScale(3.0, 3.0)
        }
        
        let completion: (Bool) -> Void = {
            _ in
            label.removeFromSuperview()
        }

        UIView.animateWithDuration(SuchAnimateTime,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: animations,
            completion: completion)
    }
}
