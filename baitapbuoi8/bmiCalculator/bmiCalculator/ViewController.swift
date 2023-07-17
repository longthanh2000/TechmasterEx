//
//  ViewController.swift
//  bmiCalculator
//
//  Created by Nguyen Thanh Long on 18/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbHeight: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var femaleBtn: UIButton!
    @IBOutlet var maleBtn: UIButton!
    
    
    @IBOutlet var plusWeight: UIButton!
    @IBOutlet var minusWeight: UIButton!
    @IBOutlet var lbAge: UILabel!
    @IBOutlet var lbWeight: UILabel!
    
    @IBOutlet var minusAbe: UIButton!
    
    @IBOutlet var plusAge: UIButton!
    
    private var weight = 0
    private var age = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func setHeight(_ sender: Any) {
        lbHeight.text = String(Int(slider.value)) + " cm"
    }
    
    @IBAction func minusWeightTapped(_ sender: Any) {
        weight -= 1
        lbWeight.text = weight > 0 ? String(weight) : "0"
    }
    
    @IBAction func plusWeightTapped(_ sender: Any) {
        weight += 1
        lbWeight.text = String(weight)
    }
    
    @IBAction func minusAgeTapped(_ sender: Any) {
        age -= 1
        lbAge.text = age > 0 ? String(age) : "0"
    }
    @IBAction func plusAgeTapped(_ sender: Any) {
        age += 1
        lbAge.text = String(age)
    }
    
    @IBAction func calculate(_ sender: Any) {
        print(Double(weight))
        print(pow(Double(slider.value), 2) / 100)
        print(Double(weight) / pow(Double(slider.value) / 100, 2))


    }
    
    
}

