//
//  ViewController.swift
//  trafficlight
//
//  Created by Nguyen Thanh Long on 01/08/2023.
//

import UIKit

class ViewController: UIViewController{
    let redButton = UIButton(type: .custom)
       let yellowButton = UIButton(type: .custom)
       let greenButton = UIButton(type: .custom)
       let countdownLabel = UILabel()
       
       var timer: Timer?
       var remainingTime: Int = 0
       
       override func viewDidLoad() {
           view.backgroundColor = .black
           super.viewDidLoad()
           setupButtons()
           setupConstraints()
       }
       
       func setupButtons() {
           
           // Thiết lập màu ban đầu cho các button
           redButton.backgroundColor = .gray
           yellowButton.backgroundColor = .gray
           greenButton.backgroundColor = .gray
           
           // Thêm hành động cho các button
           redButton.addTarget(self, action: #selector(redButtonTapped), for: .touchUpInside)
           yellowButton.addTarget(self, action: #selector(yellowButtonTapped), for: .touchUpInside)
           greenButton.addTarget(self, action: #selector(greenButtonTapped), for: .touchUpInside)
           
           // Thêm các button và countdownLabel vào view
           view.addSubview(redButton)
           view.addSubview(yellowButton)
           view.addSubview(greenButton)
           view.addSubview(countdownLabel)
           
           // Thiết lập countdownLabel
           countdownLabel.textAlignment = .center
           countdownLabel.font = UIFont.boldSystemFont(ofSize: 70)
           countdownLabel.isHidden = true
           
       }
       
       func setupConstraints() {
           // Tạo và thêm constraint cho các button và countdownLabel
           redButton.translatesAutoresizingMaskIntoConstraints = false
           yellowButton.translatesAutoresizingMaskIntoConstraints = false
           greenButton.translatesAutoresizingMaskIntoConstraints = false
           countdownLabel.translatesAutoresizingMaskIntoConstraints = false
           
           // Red Button Constraints
           redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           redButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
           redButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
           redButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
           
           // Yellow Button Constraints
           yellowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           yellowButton.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: 20).isActive = true
           yellowButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
           yellowButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
           // Green Button Constraints
           greenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           greenButton.topAnchor.constraint(equalTo: yellowButton.bottomAnchor, constant: 20).isActive = true
           greenButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
           greenButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
           // Countdown Label Constraints
           countdownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           countdownLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
           
           // Tạo hình tròn cho các button
           redButton.layer.cornerRadius = 30
           yellowButton.layer.cornerRadius = 30
           greenButton.layer.cornerRadius = 30
           redButton.layer.masksToBounds = true
           yellowButton.layer.masksToBounds = true
           greenButton.layer.masksToBounds = true
           
       }
       
       @objc func redButtonTapped() {
           setTrafficLightState(red: true, yellow: false, green: false, time: 10)
           countdownLabel.textColor = .red
          
       }
       
       @objc func yellowButtonTapped() {
           setTrafficLightState(red: false, yellow: true, green: false, time: 3)
           countdownLabel.textColor = .yellow
           
       }
       
       @objc func greenButtonTapped() {
           setTrafficLightState(red: false, yellow: false, green: true, time: 15)
           countdownLabel.textColor = .green
          
       }
       
       func setTrafficLightState(red: Bool, yellow: Bool, green: Bool, time: Int) {
           redButton.backgroundColor = red ? .red : .gray
           
           yellowButton.backgroundColor = yellow ? .yellow : .gray
           greenButton.backgroundColor = green ? .green : .gray
           
           redButton.isEnabled = !red
           yellowButton.isEnabled = !yellow
           greenButton.isEnabled = !green
           
           if let timer = self.timer, timer.isValid {
               timer.invalidate()
           }
           
           if time > 0 {
               countdownLabel.isHidden = false
               remainingTime = time
               updateCountdownLabel()
               
               timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                   self?.remainingTime -= 1
                   self?.updateCountdownLabel()
                   if self?.remainingTime == 0 {
                       self?.setTrafficLightState(red: false, yellow: false, green: false, time: 0)
                   }
               }
           } else {
               countdownLabel.isHidden = true
           }
       }
       
    func updateCountdownLabel() {
        if remainingTime > 0 {
            countdownLabel.text = "\(remainingTime)"
        } else {
            countdownLabel.text = "Time's up!"
            if redButton.backgroundColor == .red {
                setTrafficLightState(red: false, yellow: true, green: false, time: 3)
                countdownLabel.textColor = .yellow
            } else if yellowButton.backgroundColor == .yellow {
                setTrafficLightState(red: false, yellow: false, green: true, time: 15)
                countdownLabel.textColor = .green
            } else if greenButton.backgroundColor == .green {
                setTrafficLightState(red: true, yellow: false, green: false, time: 10)
                countdownLabel.textColor = .red
            }
        }
    }


    func switchTrafficLight() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.setTrafficLightState(red: false, yellow: true, green: false, time: 3)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                self?.setTrafficLightState(red: false, yellow: false, green: true, time: 15)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 15) { [weak self] in
                    self?.setTrafficLightState(red: true, yellow: false, green: false, time: 10)
                }
            }
        }
    }
    }




