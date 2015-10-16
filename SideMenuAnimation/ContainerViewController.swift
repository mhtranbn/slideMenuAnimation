//
//  ContainerViewController.swift
//  SideMenuAnimation
//
//  Created by todd.kim on 2015-10-16.
//  Copyright © 2015년 Clipper Works. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var masterView: UIView!

    @IBOutlet weak var rightConstraint1: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint2: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doSwipeLeft(sender: UISwipeGestureRecognizer) {
        let moved = self.menuView.frame.width
        self.slide(moved, contentConstant: moved)
    }
    
    @IBAction func doSwipeRight(sender: UISwipeGestureRecognizer) {
        self.slide(0, contentConstant: 0)
    }
    
    @IBAction func tabbedMenu(sender: AnyObject) {
        if rightConstraint1.constant == 0 {
            let moved = self.menuView.frame.width
            self.slide(moved, contentConstant: moved)
        } else {
            self.slide(0, contentConstant: 0)
        }
    }
    
    func slide(headerConstant: CGFloat, contentConstant: CGFloat) {
        self.rightConstraint1.constant = headerConstant
        self.rightConstraint2.constant = contentConstant
        UIView.animateWithDuration(0.3) {
            self.view.layoutIfNeeded()
        }
    }
}