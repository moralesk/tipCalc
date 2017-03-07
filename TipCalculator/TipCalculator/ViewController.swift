//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kelly Morales on 2/26/17.
//  Copyright © 2017 Kelly Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
   
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var lineView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "selectedTipIndex")
        calculateTip((AnyObject).self as (AnyObject))
        billLabel.alpha = 0
        billTextField.alpha = 0
        tipLabel.alpha = 0
        tipAmountLabel.alpha = 0
        totalLabel.alpha = 0
        totalAmountLabel.alpha = 0
        tipControl.alpha = 0
        lineView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4, animations: {
            self.billLabel.alpha = 1
            self.billTextField.alpha = 1
            self.tipLabel.alpha = 1
            self.tipAmountLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.totalAmountLabel.alpha = 1
            self.tipControl.alpha = 1
            self.lineView.alpha = 1
        })
        billTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        // dismiss keyboard when user taps anywhere
        view.endEditing(true)
    }

    /* Editing Changed -> Calculate Tip when user changes textfield text.
       Segmented Controller Value Changed also calls this function.
     */
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
}

