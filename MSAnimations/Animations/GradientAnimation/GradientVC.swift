//
//  GradientVC.swift
//  MSAnimations
//
//  Created by mr.scorpion on 16/8/6.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

import UIKit

class GradientVC: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the background image.
        let backgroundImageView = UIImageView(image: UIImage(named: "Gradient_background"))
        backgroundImageView.frame = self.view.bounds
        backgroundImageView.contentMode = .ScaleAspectFill
        backgroundImageView.clipsToBounds = true
        self.view.addSubview(backgroundImageView)
        
        // Add Loading Label.
        let label = LoadingLabel()
        label.frame = CGRectMake(100, 100, 200, 30)
        label.text = "hello world"
        self.view.addSubview(label)
    }

    // MARK: - Status Bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
