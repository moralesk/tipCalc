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

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func defaultTipPercentageChanged() {
        UserDefaults.standard.set(tipController.selectedSegmentIndex, forKey: "selectedTipIndex")
    }
    
}
