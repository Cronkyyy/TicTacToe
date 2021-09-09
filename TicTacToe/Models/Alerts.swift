//
//  Alerts.swift
//  TicTacToe
//
//  Created by Dylan Cronk on 9/8/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You win!"), message: Text("You are smarter than the computer!"), buttonTitle: Text("Nice!"))
    static let computerWin = AlertItem(title: Text("You lose!"), message: Text("You are not smarter than the computer!"), buttonTitle: Text("Sorry!"))
    static let draw = AlertItem(title: Text("Draw!"), message: Text("You are equally as intelligent as the computer!"), buttonTitle: Text("Ok!"))
}
