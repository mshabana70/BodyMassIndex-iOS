//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Mahmoud shabana on 7/5/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var BMI: Float?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        // BMI = Weight(KG) / Height(m)^2
        // first convert lbs to kg and ft to m
               
        BMI = 703 * (weight / pow(height, 2))
    }
    
    func getBMIValue() -> String {
        let bmiValue = String(format: "%.1f", BMI)
        return bmiValue
    }
}
