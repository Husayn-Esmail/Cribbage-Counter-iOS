//
//  GameView.swift
//  Cribbage Counter iOS
//
//  Created by Husayn Esmail on 2023-02-10.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: Game
    var body: some View {
        NavigationView {
            VStack {
                Text("Players: \(game.Players)")
                List {
                    ForEach(game.scores.sorted(by: >), id: \.key) { key, value in
                        Text("\(key) :     \(value)")
                    }
                }
                HStack{
                    VStack {
                            Text("Player 1 Actions:")
                        HStack{
                            Button("+", action: {game.incrementScore(playerName: "Player1", number: 1)})
                            if (game.scores["Player1"] ?? 0 > 0) {
                                Button("-", action: {game.incrementScore(playerName: "Player1", number: -1)})
                            }
                        }
                    }.padding()
                    VStack{
                        Text("Player 2 Actions:")
                        HStack{
                            Button("+", action:{game.incrementScore(playerName: "Player2", number: 1)})
                            if (game.scores["Player2"] ?? 0 > 0) {
                                Button("-", action: {game.incrementScore(playerName: "Player2", number: -1)})
                            }
                        }
                    }.padding()
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Game())
    }
}
