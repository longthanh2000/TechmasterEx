//
//  ViewController.swift
//  IamRich
//
//  Created by Nguyen Thanh Long on 18/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbRich: UILabel!
    @IBOutlet var imgDianmond: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgDianmond.alpha = 0.0
        lbRich.alpha = 0.0
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIImageView.animate(withDuration: 5.0, animations: {
            self.imgDianmond.alpha = 1.0
            self.lbRich.alpha = 1.0
            self.lbRich.frame.origin.y = self.lbRich.frame.origin.y - 150
                })
    }
   


}

