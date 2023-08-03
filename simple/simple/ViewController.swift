//
//  ViewController.swift
//  simple
//
//  Created by Nguyen Thanh Long on 03/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var botScoreLb: UILabel!
    @IBOutlet var yourScorelb: UILabel!
    @IBOutlet var botScore: UILabel!
    @IBOutlet var yourScore: UILabel!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var buttonPlay: UIButton!
    @IBOutlet var imgBot: UIImageView!
    @IBOutlet var imgYou: UIImageView!
    @IBOutlet var resultLb: UILabel!
    @IBOutlet var hand: UIButton!
    @IBOutlet var punchHand: UIButton!
    @IBOutlet var cutHand: UIButton!
    
    @IBOutlet var lbBot: UILabel!
    @IBOutlet var lbYou: UILabel!
    var random = 0
    private var countYourScore = 0
    private var countBotScore = 0
    private var isPlay = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    // 1 là kéo
    // 2 là búa
    // 3 bao
    
    func setupView() {
        hand.layer.cornerRadius = hand.frame.width / 2
        punchHand.layer.cornerRadius = punchHand.frame.width / 2
        cutHand.layer.cornerRadius = cutHand.frame.width / 2
        hand.layer.masksToBounds = true
        punchHand.layer.masksToBounds = true
        cutHand.layer.masksToBounds = true
        cutHand.isEnabled = isPlay
        punchHand.isEnabled = isPlay
        hand.isEnabled = isPlay
        imgYou.isHidden = !isPlay
        imgBot.isHidden = !isPlay
        resultLb.isHidden = !isPlay
        lbYou.isHidden = !isPlay
        lbBot.isHidden = !isPlay
        yourScore.isHidden = !isPlay
        botScore.isHidden = !isPlay
        botScoreLb.isHidden = !isPlay
        yourScorelb.isHidden = !isPlay
        yourScore.text = "0"
        botScore.text = "0"
    }
    
    func getRandom(_ randomValue : Int) {
        // Generates a random integer between 1 and 6 (inclusive)
        if randomValue == 1 {
            imgBot.image = UIImage(named: "cut")
        } else if randomValue == 2 {
            imgBot.image = UIImage(named: "punch")
        } else {
            imgBot.image = UIImage(named: "hand")
        }
    }
    
    func check(_ choice : Int, _ random : Int) {
        if random == 1 && choice == 3 || random == 2 && choice == 1 || random == 3 && choice == 1 {
            resultLb.text = "Lose"
            countBotScore += 1
        } else if random == choice {
            resultLb.text = "Draw"
        } else {
            resultLb.text = "Win"
            countYourScore += 1
        }
        
        yourScore.text = String(countYourScore)
        botScore.text = String(countBotScore)
    }
    
    @IBAction func tappedCut(_ sender: Any) {
        cutHand.alpha = 0.4
        let randomValue = Int.random(in: 1...3)
        getRandom(randomValue)
        check(1, randomValue)
        imgYou.image = UIImage(named: "cut")
        cutHand.alpha = 1
    }
    
    @IBAction func tappedPunch(_ sender: Any) {
        punchHand.alpha = 0.4
        let randomValue = Int.random(in: 1...3)
        getRandom(randomValue)
        check(2, randomValue)
        imgYou.image = UIImage(named: "punch")
        punchHand.alpha = 1
    }
    
    @IBAction func tappedHand(_ sender: Any) {
        hand.alpha = 0.4
        let randomValue = Int.random(in: 1...3)
        getRandom(randomValue)
        check(3, randomValue)
        imgYou.image = UIImage(named: "hand")
        hand.alpha = 1
    }
    
    @IBAction func tappedPlay(_ sender: Any) {
        isPlay.toggle()
        cutHand.isEnabled = isPlay
        punchHand.isEnabled = isPlay
        hand.isEnabled = isPlay
        imgYou.isHidden = !isPlay
        imgBot.isHidden = !isPlay
        resultLb.isHidden = !isPlay
        lbYou.isHidden = !isPlay
        lbBot.isHidden = !isPlay
        btnPlay.isHidden = isPlay
        yourScore.isHidden = !isPlay
        botScore.isHidden = !isPlay
        botScoreLb.isHidden = !isPlay
        yourScorelb.isHidden = !isPlay
    }
    
    
}

