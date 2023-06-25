//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    
    @IBOutlet var splitNumberLabel: UILabel!
    
    var userInput = ""
    var tip: Double = 0.1
    var numberOfPeople = 2
    var totalAmount: Double = 0.0
    
    var result: Double = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true) // to dismiss the keyboard.
        totalAmount = Double(billTextField.text!) ?? 0.0
        
        let tipSelected = Double(sender.currentTitle!.dropLast())
        
        tip = tipSelected! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        result = (totalAmount + (totalAmount * tip)) / Double(numberOfPeople)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        
        destinationVC.totalAnswer = String(format: "%.2f", result)
        destinationVC.descValue = "Split between \(numberOfPeople) people, with \(String(format: "%.0f", tip * 100))% tip."
    }
}
