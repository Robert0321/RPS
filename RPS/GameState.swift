//
//  GameData.swift
//  RPS
//
//  Created by robert on 2022/11/18.
//

import Foundation
//顯示輸贏狀況
enum GameState {
    case start
    case win
    case lose
    case draw
    
    var status: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lost!"
        case .draw:
            return "It's a Draw"
        }
    }
}
