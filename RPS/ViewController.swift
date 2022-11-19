//
//  ViewController.swift
//  RPS
//
//  Created by robert on 2022/11/18.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var SignLabel: UILabel!
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var RockButton: UIButton!
    @IBOutlet weak var PaperButton: UIButton!
    @IBOutlet weak var ScissorsButton: UIButton!
    @IBOutlet weak var PlayAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(forState: .start)
    }
    
    
    @IBAction func rockChosen(_ sender: Any) {
        play(userSign: .rock)
    }
    
    
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    
    @IBAction func scissorsChosen(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(forState: .start)
    }
    func updateUI(forState state: GameState) {
        StatusLabel.text = state.status

        switch state {
        case .start:
            view.backgroundColor = .gray
            
            SignLabel.text = "🤖"
            PlayAgainButton.isHidden = true
            
            RockButton.isHidden = false
            PaperButton.isHidden = false
            ScissorsButton.isHidden = false

            RockButton.isEnabled = true
            PaperButton.isEnabled = true
            ScissorsButton.isEnabled = true
        case .win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)
        case .draw:
            view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)
        }
    }
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        SignLabel.text = computerSign.emoji
        
        RockButton.isHidden = true
        PaperButton.isHidden = true
        ScissorsButton.isHidden = true
        
        RockButton.isEnabled = false
        PaperButton.isEnabled = false
        ScissorsButton.isEnabled = false
        
        switch userSign {
        case .rock:
            RockButton.isHidden = false
        case .paper:
            PaperButton.isHidden = false
        case .scissors:
            ScissorsButton.isHidden = false
        }
        PlayAgainButton.isHidden = false
    }
}

