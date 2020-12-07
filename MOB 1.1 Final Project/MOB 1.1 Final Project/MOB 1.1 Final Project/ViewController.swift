//
//  ViewController.swift
//  MOB 1.1 Final Project
//
//  Created by Sawyer Cherry on 11/30/20.
//

import UIKit




class ViewController: UIViewController {
    // comment
    @IBAction func noButton(_ sender: Any) {
        userClickedNo()
        getTopColor()
        getBottomColor()
        if gameStarted == false {
            startTimer()
            gameStarted = true
        }
        
    }
    
    @IBAction func yesButton(_ sender: Any) {
        userClickedYes()
        getTopColor()
        getBottomColor()
        if gameStarted == false {
            startTimer()
            gameStarted = true
        }
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        resetButtonClicked()
        getTopColor()
        getBottomColor()
        self.timer?.invalidate()
        gameStarted = false
        seconds = 60
        noButton.isHidden = false
        yesButton.isHidden = false
        topCard.isHidden = false
        bottomCard.isHidden = false
        finalMessage.isHidden = true
        
    }
    
    
    @IBOutlet weak var topCard: UILabel!
    
    @IBOutlet weak var finalMessage: UILabel!
    
    @IBOutlet weak var bottomCard: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var yesButton: UIButton!
    
    var gameStarted = false
    
    var colorArray = ["red", "blue", "green", "yellow", "brown", "orange"]
    var UIColorArray: [UIColor] = [.red, .blue, .green, .yellow, .brown, .orange]
    
    var randomUIColor: UIColor!
    var randomIndex: Int!
    
    var score = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    var timer: Timer?
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    var seconds = 60 {
        didSet {
            timerLabel.text = String(seconds)
            if seconds == 0 {
                
                finalMessage.isHidden = false
                finalMessage.text = "Time's Up! Final Score \(score)"
                self.timer?.invalidate()
                noButton.isHidden = true
                yesButton.isHidden = true
                topCard.isHidden = true
                bottomCard.isHidden = true
                
            }
        }
    }
    
    @objc func fireTimer() {
        seconds -= 1
    }
    func getUIColor() {
        
        randomIndex = Int.random(in: 0...UIColorArray.count - 1)
        randomUIColor = UIColorArray[randomIndex]
        
        
    }
    func getColor(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getTopColor()
        getBottomColor()
        finalMessage.isHidden = true
    }
    
    func getTopColor() {
        getUIColor()
        topCard.text = colorArray[randomIndex]
        
        
    }
    
    func getBottomColor() {
        getUIColor()
        bottomCard.text = colorArray[randomIndex]
        bottomCard.textColor = randomUIColor
    }
    
    // "red", "blue", "green", "yellow", "brown", "orange"
    func userClickedNo() {
        if topCard.text == "red" && randomUIColor == UIColor.red {
            score -= 10
        } else if topCard.text == "green" && randomUIColor == UIColor.green {
            score -= 10
        } else if topCard.text == "blue" && randomUIColor == UIColor.blue {
            score -= 10
        } else if topCard.text == "yellow" && randomUIColor == UIColor.yellow {
            score -= 10
        } else if topCard.text == "brown" && randomUIColor == UIColor.brown {
            score -= 10
        } else if topCard.text == "orange" && randomUIColor == UIColor.orange {
            score -= 10
        } else {score += 10}
        
        
        
    }
    
    func userClickedYes() {
        if topCard.text == "red" && randomUIColor == UIColor.red {
            score += 10
        } else if topCard.text == "green" && randomUIColor == UIColor.green {
            score += 10
        } else if topCard.text == "blue" && randomUIColor == UIColor.blue {
            score += 10
        } else if topCard.text == "yellow" && randomUIColor == UIColor.yellow {
            score += 10
        } else if topCard.text == "brown" && randomUIColor == UIColor.brown {
            score += 10
        } else if topCard.text == "orange" && randomUIColor == UIColor.orange {
            score += 10
        } else {score -= 10}
    }
    
    func resetButtonClicked() {
        score = 0
        
    }
    func updateCards() {
        
    }
    
    
}

