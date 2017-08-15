//
//  SettingsViewController.swift
//  tipper
//
//  Created by Justin Sumner on 8/10/17.
//  Copyright © 2017 Justin Sumner. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_value")
        print(intValue)
        defSetter.selectedSegmentIndex = intValue
    }

    @IBOutlet weak var defSetter: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defSet(_ sender: Any) {
        print(defSetter.selectedSegmentIndex)
        let defaults = UserDefaults.standard // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
        let defaultTipValue = defSetter.selectedSegmentIndex
        defaults.set(defaultTipValue, forKey: "default_tip_value")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
