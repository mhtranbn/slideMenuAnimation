//
//  MenuTableViewController.swift
//  SideMenuAnimation
//
//  Created by todd.kim on 2015-10-16.
//  Copyright © 2015년 Clipper Works. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    private let data = ["ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = self.data[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let viewControllers = navigationController?.viewControllers {
            for controller in viewControllers {
                if controller.restorationIdentifier == "container" {
                    let container = controller as! ContainerViewController
                    for child in container.childViewControllers {
                        if child.restorationIdentifier == "master" {
                            let master = child as! MasterViewController
                            master.selected = self.data[indexPath.row]
                            master.viewWillAppear(false)
                        }
                    }
                    
                    container.slide(0, contentConstant: 0)
                }
            }
        }
    }
}