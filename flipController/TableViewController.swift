//
//  TableViewController.swift
//  flipController
//
//  Created by Yaser Almasri on 8/20/16.
//  Copyright © 2016 MaSys. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellId = "cellId"
    
    let menus = ["First", "Second"]
    
    var controller: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .FlipHorizontal
        self.view.backgroundColor = .whiteColor()
        tableView.registerClass(MenuCell.self, forCellReuseIdentifier: cellId)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! MenuCell

        cell.nameLabel.text = menus[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.dismissViewControllerAnimated(true) {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            if self.menus[indexPath.row] == "First" {
                self.controller = ViewController()
            }
            else if self.menus[indexPath.row] == "Second" {
                self.controller = ViewController2()
            }
            
            if let con = self.controller {
                if con != appDelegate.window!.rootViewController {
                    appDelegate.window!.rootViewController = UINavigationController(rootViewController: con)
                }
            }
        }
    }
    
}



class MenuCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(nameLabel)
        self.nameLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        self.nameLabel.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}