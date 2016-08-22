//
//  ViewController2.swift
//  flipController
//
//  Created by Yaser Almasri on 8/20/16.
//  Copyright © 2016 MaSys. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Second Controller"
        label.font = UIFont.systemFontOfSize(40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var goBtn: UIButton = {
        let button = UIButton(type: .System)
        button.setTitle("Menu", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleShowMenu), forControlEvents: .TouchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .whiteColor()
        self.navigationItem.title = "Second Controller"

        self.view.addSubview(secondLabel)
        secondLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        secondLabel.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 70).active = true
        
        self.view.addSubview(goBtn)
        self.goBtn.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.goBtn.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        
    }
    
    func handleShowMenu() {
        let menuController = TableViewController()
        self.presentViewController(menuController, animated: true, completion: nil)
    }

}
