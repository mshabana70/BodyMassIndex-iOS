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
    
    var bmiValue = "0.0"

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
        heightLabel.text = "\(String(format: "%.2f", sender.value)) ft"
    }
    
    //Print value of weight slider in console
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //Turn slider value into string and format for 0 decimal places
        weightLabel.text = "\(String(format: "%.0f", sender.value)) lbs"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var height = heightSlider.value
        var weight = weightSlider.value
        
        // BMI = Weight(KG) / Height(m)^2
        // first convert lbs to kg and ft to m
        height = height * 0.3048
        weight = weight * 0.453592
        
        let BMI = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", BMI)
        
        //let secondVC = SecondViewController()
        //secondVC.bmiValue = String(format: "%.1f", BMI)
        //self.present(secondVC, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // VC that will be init when segue is performed
            let destinationVC = segue.destination as! ResultViewController // narrow down the datatype of UIViewController to ResultViewController using downcasting
            destinationVC.bmiValue = bmiValue
        }
    }
    
}

