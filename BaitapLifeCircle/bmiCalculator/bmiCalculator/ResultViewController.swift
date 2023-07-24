//
//  ResultViewController.swift
//  bmiCalculator
//
//  Created by Nguyen Thanh Long on 24/07/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var btnBanck: UIButton!
    @IBOutlet var viewResult: UIView!
    @IBOutlet var discriptionLb: UILabel!
    @IBOutlet var bmiResult: UILabel!
    @IBOutlet var stateLb: UILabel!
    var bmi : String = ""
    var color : UIColor?
    var discription : String = ""
    var state: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    func setupView() {
        stateLb.text = state
        stateLb.textColor = color
        discriptionLb.text = discription
        bmiResult.text = bmi
        
        viewResult.layer.cornerRadius = 5
        viewResult.layer.masksToBounds = true
        
        btnBanck.layer.cornerRadius = 10
        btnBanck.layer.masksToBounds = true
    }
    

    @IBAction func reCalTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
