//
//  BMI.swift
//  bmiCalculator
//
//  Created by Nguyen Thanh Long on 24/07/2023.
//

import Foundation
import UIKit

enum BMI {
    case underWeight
    case normal
    case overWeight
    case obese
    case serverlyObese
    case morbidlyObese
}

func checkBMI(bmiIndicator: Double ) -> BMI {
    if bmiIndicator < 18.5 {
        return .underWeight
    } else if bmiIndicator > 18.5 && bmiIndicator < 24.9 {
        return .normal
    } else if bmiIndicator > 25 && bmiIndicator < 29.9 {
        return .overWeight
    } else if bmiIndicator > 30 && bmiIndicator < 34.9 {
        return .obese
    } else if bmiIndicator > 35 && bmiIndicator < 39.9 {
        return .serverlyObese
    } else{
        return .morbidlyObese
    }
    
}
// Hàm trả về giá trị cho biến title dựa trên enum BMI
func getTitle(for bmi: BMI) -> String {
    switch bmi {
    case .underWeight:
        return "Under weight"
    case .normal:
        return "Normal"
    case .overWeight:
        return "Over weight"
    case .obese:
        return "Obese"
    case .serverlyObese:
        return "Severely Obese"
    case .morbidlyObese:
        return "Morbidly Obese"
    }
}
func getColor(for bmi: BMI) -> UIColor {
    switch bmi {
    case .underWeight:
        return UIColor.green
    case .normal:
        return UIColor.green
    case .overWeight:
        return UIColor.systemPink
    case .obese:
        return UIColor.systemPink
    case .serverlyObese:
        return UIColor.red
    case .morbidlyObese:
        return UIColor.red
    }
}
func getDescription(for bmi : BMI) -> String {
    switch bmi {
    case .underWeight:
        return "You are below normal weight. Consider consulting a healthcare professional."
    case .normal:
        return "You have a normal body weight. Good job!"
    case .overWeight:
        return "You are above normal weight. Consider adopting a balanced diet and regular exercise."
    case .obese:
        return "You are in the obese range. It's essential to focus on weight management for better health."
    case .serverlyObese:
        return "You are severely obese. Seek medical advice and support for weight management."
    case .morbidlyObese:
        return "You are morbidly obese. Urgent medical attention and weight management are crucial."
    }
}
