//
//  Sign.swift
//  RPS
//
//  Created by robert on 2022/11/18.
//

import Foundation

enum Sign: String {
    case rock
    case paper
    case scissors
    
    //η’η emoji ε
    var emoji: String {
        switch self {
        case .rock:
            return "π"
        case .paper:
            return "π"
        case .scissors:
            return "βοΈ"
        }
    }
    
    //εε³θΌΈθ΄ηζ³
    func gameState(against opponentSign: Sign) -> GameState {
        switch self {
        case .rock:
            if opponentSign == .scissors {
                return .win
            } else if opponentSign == .paper {
                return .lose
            }
        case .paper:
            if opponentSign == .rock {
                return .win
            } else if opponentSign == .scissors {
                return .lose
            }
        case .scissors:
            if opponentSign == .paper {
                return .win
            } else if opponentSign == .rock {
                return .lose
            }
        }
        return .draw
    }
}


//ι»θ¦ι¨ζ©εΊζ³
func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
