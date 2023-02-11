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
                    ForEach(game.scores.sorted(by: <), id: \.key) { key, value in
                        Text("\(key) :     \(value)")
                    }
                    ForEach(game.scores.sorted(by: <), id: \.key) { player, score in
                        Text("\(player)")
                        VStack {
                                Text("\(player) Actions:")
                            HStack{
                                if (game.scores[player] ?? 0 > 0) {
                                    Button("-", action: {game.incrementScore(playerName: player, number: -1)})
                                }
                                Button("+", action: {game.incrementScore(playerName: player, number: 1)})
                            }
                            HStack {
                                Button("15", action:{ game.incrementScore(playerName: player, number: 2)})
                                Button("31", action: {game.incrementScore(playerName: player, number: 2)})
                            }
                            HStack {
                                Button("Pair", action: { game.incrementScore(playerName: player, number: 2)})
                            }
                            HStack {
                                Button("Triplet", action: {
                                    game.incrementScore(playerName: player, number: 6)
                                })
                            }
                            HStack {
                                Button("Four", action :{game.incrementScore(playerName: player, number: 12)})
                            }
                            HStack{
                                Button("run (3)", action : {game.incrementScore(playerName: player, number: 3)})
                                Button("run (4)", action: {game.incrementScore(playerName: player, number: 4)})
                                Button("run (5)", action: {game.incrementScore(playerName: player, number: 5)})
                            }
                            HStack {
                                Button("Go", action: {game.incrementScore(playerName: player, number: 1)})
                            }
                            HStack{
                                Button("His Knobs", action: {game.incrementScore(playerName: player, number: 1)})
                                Button("His Heels", action: {game.incrementScore(playerName: player, number: 2)})
                                Button("Flush", action: {game.incrementScore(playerName: player, number: 4)})
                            }
                        }.padding().buttonStyle(.borderedProminent)
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Game())
    }
}
