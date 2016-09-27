//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Haider Khan on 9/24/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var topTipField: UITextField!
    @IBOutlet weak var middleTipField: UITextField!
    @IBOutlet weak var bottomTipField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add targets
        topTipField.addTarget(self, action: #selector(topFieldDidEnd(textField:)), for: UIControlEvents.editingDidEnd)
        middleTipField.addTarget(self, action: #selector(middleFieldDidEnd(textField:)), for: UIControlEvents.editingDidEnd)
        bottomTipField.addTarget(self, action: #selector(bottomFieldDidEnd(textField:)), for: UIControlEvents.editingDidEnd)
        
        // Get defaults
        let defaults = UserDefaults.standard
        let top = defaults.double(forKey: "top")
        let middle = defaults.double(forKey: "middle")
        let bottom = defaults.double(forKey: "bottom")
        
        if (top != 0) {
            topTipField.text = String(top)
        }
        
        if (middle != 0) {
            middleTipField.text = String(middle)
        }
        
        if (bottom != 0) {
            bottomTipField.text = String(bottom)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func topFieldDidEnd(textField: UITextField) {
        
        let value = NSString(string: textField.text!).doubleValue
        defaults.set(value, forKey: "top")
    }
    
    @objc func middleFieldDidEnd(textField: UITextField) {
        
        let value = NSString(string: textField.text!).doubleValue
        defaults.set(value, forKey: "middle")
    }
    
    @objc func bottomFieldDidEnd(textField: UITextField) {
        
        let value = NSString(string: textField.text!).doubleValue
        defaults.set(value, forKey: "bottom")
    }

}
