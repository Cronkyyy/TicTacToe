//
//  GameView.swift
//  TicTacToe
//
//  Created by Dylan Cronk on 9/8/21.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TitleView()
                Spacer()
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(0..<9) { i in
                        ZStack {
                            TileView(proxy: geometry)
                            
                            TileMarker(systemImageName: viewModel.moves[i]?.marker ?? "")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .background(Color.gray)
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: { viewModel.resetGame()}))
            })
        }
    }
}

struct TileView: View {
    let proxy: GeometryProxy
    var body: some View {
        Rectangle().foregroundColor(.white)
            .frame(width: proxy.size.width/3 - 15, height: proxy.size.width/3 - 15)
    }
}

struct TitleView: View {
    var body: some View {
        Text("Tic Tac Toe")
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

struct TileMarker: View {
    let systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


