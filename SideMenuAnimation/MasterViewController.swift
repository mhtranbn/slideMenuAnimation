//
//  MasterViewController.swift
//  SideMenuAnimation
//
//  Created by Mac Dev on 2015. 10. 16..
//  Copyright © 2015년 Clipper Works. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    
    var selected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let ff = selected {
            text.text = ff
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}