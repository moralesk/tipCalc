//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Kelly Morales on 2/28/17.
//  Copyright © 2017 Kelly Morales. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var defaultTipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipController.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "selectedTipIndex")
        defaultTipLabel.alpha = 0
        tipController.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4, animations: {
            self.defaultTipLabel.alpha = 1
            self.tipController.alpha = 1
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func defaultTipPercentageChanged() {
        UserDefaults.standard.set(tipController.selectedSegmentIndex, forKey: "selectedTipIndex")
    }
    
}
