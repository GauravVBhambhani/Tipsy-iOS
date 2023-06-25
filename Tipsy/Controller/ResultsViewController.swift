//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Gaurav Bhambhani on 6/24/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var totalAnswer: String?
    var descValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalAnswer!
        settingsLabel.text = descValue
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
