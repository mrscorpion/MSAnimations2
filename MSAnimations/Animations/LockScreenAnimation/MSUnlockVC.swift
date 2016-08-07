//
//  MSUnlockVC.swift
//  MSAnimations
//
//  Created by mr.scorpion on 16/8/7.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

import UIKit

class MSUnlockVC: UIViewController {

    // MARK: - Properties
    @IBOutlet var topLock: UIImageView!
    @IBOutlet var bottomLock: UIImageView!
    @IBOutlet var lockBorder: UIImageView!
    @IBOutlet var lockKeyhole: UIImageView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //println(nibName);
    }
    convenience init() {
        let nibNameOrNil = String?("MSUnlockVC")
        //        //考虑到xib文件可能不存在或被删，故加入判断
        //        if NSBundle.mainBundle().pathForResource(nibNameOrNil, ofType: "xib") == nil{   nibNameOrNil = nil}
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置背景
        let bg = UIImageView(frame: self.view.bounds)
        bg.image = UIImage.init(named: "three")
        self.view.addSubview(bg)
        self.view.sendSubviewToBack(bg)
        
        // 开锁
        openLock()
    }
    
    // MARK: Convenience
    func openLock() {
        UIView.animateWithDuration(0.4, delay: 1.0, options: [], animations: {
            // Rotate keyhole.
            self.lockKeyhole.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion: { _ in
                UIView.animateWithDuration(0.5, delay: 0.2, options: [], animations: {
                    // Open lock.
                    let yDelta = self.lockBorder.frame.maxY
                    self.topLock.center.y -= yDelta
                    self.lockKeyhole.center.y -= yDelta
                    self.lockBorder.center.y -= yDelta
                    self.bottomLock.center.y += yDelta
                    }, completion: { _ in
                        self.topLock.removeFromSuperview()
                        self.lockKeyhole.removeFromSuperview()
                        self.lockBorder.removeFromSuperview()
                        self.bottomLock.removeFromSuperview()
                })
        })
    }
    
    // MARK: - Status Bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
