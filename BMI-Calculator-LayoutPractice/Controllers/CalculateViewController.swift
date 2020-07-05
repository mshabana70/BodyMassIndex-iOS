//
//  CalculateViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Modified by Mahmoud Shabana on 06/27/20
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Print value of height slider in console
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //Turn slider value into string and format for 2 decimal places
        let x = Int(sender.value)
        let (q, r) = x.quotientAndRemainder(dividingBy: 12)
        heightLabel.text = "\(q) ft \(r) in"
    }
    
    //Print value of weight slider in console
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //Turn slider value into string and format for 0 decimal places
        weightLabel.text = "\(String(format: "%.0f", sender.value)) lbs"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        //let secondVC = SecondViewController()
        //secondVC.bmiValue = String(format: "%.1f", BMI)
        //self.present(secondVC, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // VC that will be init when segue is performed
            let destinationVC = segue.destination as! ResultViewController // narrow down the datatype of UIViewController to ResultViewController using downcasting
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
        }
    }
    
}

