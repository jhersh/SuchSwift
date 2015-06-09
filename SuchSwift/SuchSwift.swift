//
//  SuchSwift.swift
//  SuchSwift
//
//  Created by Jonathan Hersh on 6/4/14.
//  Copyright (c) 2014 JH. All rights reserved.
//

import Foundation
import UIKit

let SuchAnimateTime : NSTimeInterval = 0.6
let SuchAnimateInterval : NSTimeInterval = 0.3

extension UIView {
    var timer : NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(SuchAnimateInterval,
            target: self,
            selector: Selector("SuchAddLabel"),
            userInfo: nil,
            repeats: true)
    }
    
    func SuchStartWow() {
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func SuchStopWow() {
        timer.invalidate()
    }
    
    func SuchAddLabel() {
        let label = UILabel.SuchRandomLabel()
        
        self.addSubview(label)
        
        let origin = CGPoint(x: 30 + CGFloat(arc4random_uniform(UInt32(self.frame.size.width - 90))),
            y: CGFloat(arc4random_uniform(UInt32(self.frame.size.height - 30))))
        
        label.frame = CGRectMake(origin.x,
            origin.y,
            label.frame.size.width,
            label.frame.size.height)
        
        let animations : () -> () = {
            label.alpha = 0.0
            label.transform = CGAffineTransformMakeScale(3.0, 3.0)
        }
        
        UIView.animateWithDuration(SuchAnimateTime,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: animations,
            completion: {
                completed in
                label.removeFromSuperview()
        })
    }
}

extension CGFloat {
    static func SuchRandomColorFloat() -> CGFloat {
        return CGFloat(30 + arc4random_uniform(185)) / 255.0
    }
}

extension UIColor {
    class func SuchRandomDarkColor() -> UIColor {
        return self(red: CGFloat.SuchRandomColorFloat(),
            green: CGFloat.SuchRandomColorFloat(),
            blue: CGFloat.SuchRandomColorFloat(),
            alpha: 1.0)
    }
}

extension UILabel {
    private class func SuchAttributedLabel(text : String) -> NSAttributedString {
        let attributes = [
            NSFontAttributeName : UIFont(name: "Comic Sans MS", size: 15)!,
            NSForegroundColorAttributeName : UIColor.SuchRandomDarkColor()
        ]
        
        return NSAttributedString(string: text, attributes: attributes )
    }
    
    private class func SuchRandomText() -> String {
        let text = ["wow", "so swift", "such xcode", "very 8", "much recompile", "so moscone", "very federighi"]
        
        return text[Int(arc4random_uniform(UInt32(text.count)))]
    }
    
    class func SuchRandomLabel() -> UILabel {
        let label = UILabel()
        label.attributedText = SuchAttributedLabel(SuchRandomText())
        label.backgroundColor = UIColor.clearColor()
        label.sizeToFit()
        
        return label
    }
}
