//
//  SuchViewController.swift
//  SuchSwift
//
//  Created by Jonathan Hersh on 6/4/14.
//  Copyright (c) 2014 JH. All rights reserved.
//

import Foundation
import UIKit

class SuchViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dogeImage = UIImageView(image: UIImage(named: "doge.jpg"))
        dogeImage.center = self.view.center
        dogeImage.alpha = 0.5
        view.addSubview(dogeImage)
        
        let tapper = UITapGestureRecognizer(target: self, action: Selector("toggleWow"))
        view.addGestureRecognizer(tapper)
        
        view.SuchStartWow()
    }
    
    func toggleWow() {
        if view.isWow {
            view.SuchStopWow()
        } else {
            view.SuchStartWow()
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.SuchStopWow()
    }
}
