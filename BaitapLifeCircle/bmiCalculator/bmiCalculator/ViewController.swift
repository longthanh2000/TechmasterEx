//
//  ViewController.swift
//  bmiCalculator
//
//  Created by Nguyen Thanh Long on 18/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var femaleView: UIView!
  
    @IBOutlet var calculateBtn: UIButton!
    @IBOutlet var maleView: UIView!
    @IBOutlet var lbHeight: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var maleBtn: UIButton!
    @IBOutlet var plusWeight: UIButton!
    @IBOutlet var minusWeight: UIButton!
    @IBOutlet var lbAge: UILabel!
    @IBOutlet var lbWeight: UILabel!
    @IBOutlet var minusAbe: UIButton!
    @IBOutlet var plusAge: UIButton!
    
    private var weight : Int!
    private var age : Int!
    private var isPressView = false
    private var isMale = false
    private var isFemale = false
    var maleBackground : UIColor?
    var femaleBackground : UIColor?
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbHeight.text = String(Int(slider.value)) + " cm"
        weight = Int(lbWeight.text ?? "0")!
        age = Int(lbAge.text ?? "0")!
        // init gesture
        let longPressButton = UILongPressGestureRecognizer(target: self, action: #selector(longpressPlus))
        let longPressButton2 = UILongPressGestureRecognizer(target: self, action: #selector(longpressPlus2))
        let longPressButton3 = UILongPressGestureRecognizer(target: self, action: #selector(longpressMinus2))
        let longPressButton4 = UILongPressGestureRecognizer(target: self, action: #selector(longpressMinus))
        // get origin backgroundcolor of male and female
        maleBackground = maleView.backgroundColor
        femaleBackground = femaleView.backgroundColor
        
        // add long press for age and weight
        plusAge.addGestureRecognizer(longPressButton2)
        plusWeight.addGestureRecognizer(longPressButton)
        minusWeight.addGestureRecognizer(longPressButton4)
        minusAbe.addGestureRecognizer(longPressButton3)
        
        
      
        view.layer.cornerRadius = 10
        
        calculateBtn.layer.cornerRadius = 10
        calculateBtn.layer.masksToBounds = true
    }
    
    @objc func pressView1(){
        isPressView = !isPressView
        maleView.backgroundColor = isPressView ? .blue : .red
        print("hihhhiihih")
    }
    
    @objc func longpressPlus(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            // Khởi tạo timer khi người dùng bắt đầu nhấn
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                if self.weight == 120 {
                    self.timer?.invalidate()
                    self.timer = nil
                } else {
                    self.weight += 1
                    self.lbWeight.text = String(self.weight)
                }
            }
        } else if sender.state == .ended {
            // Kết thúc sự kiện long press, huỷ timer
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc func longpressPlus2(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            // Khởi tạo timer khi người dùng bắt đầu nhấn
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                if self.age == 120 {
                    self.timer?.invalidate()
                    self.timer = nil
                } else {
                    self.age += 1
                    self.lbAge.text = String(self.age)
                }
           
                
            }
        } else if sender.state == .ended {
            // Kết thúc sự kiện long press, huỷ timer
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc func longpressMinus(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            // Khởi tạo timer khi người dùng bắt đầu nhấn
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                if self.weight == 1 {
                    self.timer?.invalidate()
                    self.timer = nil
                } else {
                    self.weight -= 1
                    self.lbWeight.text = String(self.weight)
                }
            }
        } else if sender.state == .ended {
            // Kết thúc sự kiện long press, huỷ timer
            timer?.invalidate()
            timer = nil
        }
    }
    @objc func longpressMinus2(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            // Khởi tạo timer khi người dùng bắt đầu nhấn
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                if self.age == 1 {
                    self.timer?.invalidate()
                    self.timer = nil
                } else {
                    self.age -= 1
                    self.lbAge.text = String(self.age)
                }
            }
        } else if sender.state == .ended {
            // Kết thúc sự kiện long press, huỷ timer
            timer?.invalidate()
            timer = nil
        }
    }


    @IBAction func setHeight(_ sender: Any) {
        lbHeight.text = String(Int(slider.value)) + " cm"
    }
    
    @IBAction func minusWeightTapped(_ sender: Any) {
        weight -= 1
        weight = weight >= 1 ? weight : 1
        lbWeight.text = String(weight)
    }
    
    @IBAction func plusWeightTapped(_ sender: Any) {
        weight += 1
        weight = weight <= 120 ? weight : 120
        lbWeight.text = String(weight)
    }
    
    @IBAction func minusAgeTapped(_ sender: Any) {
        age -= 1
        age = age >= 1 ? age : 1
        lbAge.text = String(age)
    }
    @IBAction func plusAgeTapped(_ sender: Any) {
        age += 1
        lbAge.text = String(age)
        age = age <= 120 ? age : 120
        lbAge.text = String(age)
    }
    
    @IBAction func calculate(_ sender: Any) {
        let weightDouble = Double(weight)
        let sliderValueDouble = Double(slider.value)
        let weightSquared = pow(sliderValueDouble / 100, 2)
        let bmi = weightDouble / weightSquared
        let bmiString = String(format: "%.1f", bmi)
       
        let resultViewController = ResultViewController()
        let bmiResult = checkBMI(bmiIndicator: bmi)
        let state = getTitle(for: bmiResult)
        let discription = getDescription(for: bmiResult)
        let color = getColor(for: bmiResult)
        
        resultViewController.state = state
        resultViewController.color = color
        resultViewController.discription = discription
        resultViewController.bmi = bmiString
        resultViewController.modalTransitionStyle = .coverVertical
        resultViewController.modalPresentationStyle = .fullScreen
        self.present(resultViewController, animated: true, completion: nil)

    }
    
    @IBAction func maleTapped(_ sender: Any) {
        print("Hihihhihhihhihhih")
        isMale.toggle()
        maleView.backgroundColor = isMale ? UIColor.white : maleBackground
        femaleView.backgroundColor = isMale ? maleBackground : UIColor.white
        isFemale.toggle()
        
    }
    
    @IBAction func maleTapOut(_ sender: Any) {
        maleView.backgroundColor = maleBackground
    }
    
    @IBAction func femaleTapOut(_ sender: Any) {
        femaleView.backgroundColor = femaleBackground
    }
    
    
    
    @IBAction func femaleTapped(_ sender: Any) {
        isFemale.toggle()
        femaleView.backgroundColor = isFemale ? UIColor.white : femaleBackground
        maleView.backgroundColor = isFemale ? maleBackground : UIColor.white
        isMale.toggle()
    }
    
    
}

