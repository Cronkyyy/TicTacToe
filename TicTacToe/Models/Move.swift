//
//  Move.swift
//  TicTacToe
//
//  Created by Dylan Cronk on 9/9/21.
//

import Foundation

struct Move {
    let player: Player
    let boardIndex: Int
    var marker: String {
        return player == .human ? "xmark" : "circle"
    }
}
