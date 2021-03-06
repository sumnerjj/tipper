//
//  ViewController.swift
//  tipper
//
//  Created by Justin Sumner on 8/10/17.
//  Copyright © 2017 Justin Sumner. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_value")
        print(intValue)
        tipControl.selectedSegmentIndex = intValue
        billField.text = defaults.object(forKey: "bill_value") as? String
        self.calculateTip(nil);
        billField.becomeFirstResponder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        print(tipControl)
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any?) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "bill_value")
        
    }
    
}

