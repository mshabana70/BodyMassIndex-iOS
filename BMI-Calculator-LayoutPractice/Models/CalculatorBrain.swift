//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Mahmoud shabana on 7/5/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        // BMI = Weight(KG) / Height(m)^2
        // first convert lbs to kg and ft to m
            
        let bmiValue =  703 * (weight / pow(height, 2))
        
        if bmiValue <= 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat MORE Pizza", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if bmiValue <= 24.9 {
            bmi = BMI(value: bmiValue, advice: "You're in good shape!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat LESS Pizza", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
        // if BMI != nil { use bmi } else { 0.0 }
        return bmiValue
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Out of Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.clear
    }
}
