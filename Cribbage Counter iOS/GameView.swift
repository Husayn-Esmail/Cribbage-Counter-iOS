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
            VStack(alignment: .trailing) {
//                Button("Reset", action: {game.resetGame()}).padding()
                List {
                    //                displays the name and score of each player
                    HStack {
                        ForEach(game.players, id: \.?.name) {
                            player in
                            if let validPlayer = player {
                                Text("\(validPlayer.name): \(validPlayer.score)")
                                //                            ensure that only even elements get a spacer [BUG:] This is broken
                                if (validPlayer.id % 2 == 0) {
                                    Spacer()
                                }
                                
                            }
                        }
                    }
                    
                    //                displays the buttons for each player
                    HStack {
                        ForEach(game.players, id: \.?.name) {
                            player in
                            VStack {
                                if let validPlayer = player {
                                    //                                it is important to note that this is very stupid.
                                    HStack {
                                        if validPlayer.score > 0 {
                                            Button("-", action: {game.players[validPlayer.id]?.changeScore(number: -1)})
                                        }
                                        //                                mutating valid player doesn't mutate original value so score doesn't get updated
                                        //                                also player != nil causes errors so i can't access that directly either also player is immutable
                                        //                                but the id corresponds to the player's location in the array so it works to access game.players
                                        //                                after unwrapping using id as index
                                        Button("+", action: {game.players[validPlayer.id]?.changeScore(number: 1)})
                                    }
//                                    15 and 31
                                    HStack{
                                        Button("15", action: { game.players[validPlayer.id]?.changeScore(number: 2)} )
                                        Button("31", action: { game.players[validPlayer.id]?.changeScore(number: 2)} )
                                    }
//                                   go
                                    Button("Go", action: {game.players[validPlayer.id]?.changeScore(number: 1)})
//                                    runs
                                    Text("Runs")
                                    HStack {
                                        Button("3", action: {game.players[validPlayer.id]?.changeScore(number: 3)})
                                        Button("4", action: {game.players[validPlayer.id]?.changeScore(number: 4)})
                                        Button("5", action: {game.players[validPlayer.id]?.changeScore(number: 5)})
                                        
                                    }
//                                    jack plays
                                    HStack {
                                        Button("His Knobs", action: {game.players[validPlayer.id]?.changeScore(number: 1)})
                                        Button("His Heels", action: {game.players[validPlayer.id]?.changeScore(number: 2)})
                                    }
//                                    pairs, triples, quads
                                    Text("X of a kind")
                                    VStack {
                                        Button("Pair", action: {game.players[validPlayer.id]?.changeScore(number: 2)})
                                        Button("Triplet", action: {game.players[validPlayer.id]?.changeScore(number: 6)})
                                        Button("Quadruplet", action: {game.players[validPlayer.id]?.changeScore(number: 12)})
                                    }
                                    Text("Flushes")
                                    HStack {
                                        Button("5", action: {game.players[validPlayer.id]?.changeScore(number:4)} )
                                        Button("4", action: {game.players[validPlayer.id]?.changeScore(number: 5)})
                                    }
                                }
                            }
                            if let validPlayer = player {
                                let condition = validPlayer.id % 2 == 0
                                if condition {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }.buttonStyle(.borderedProminent)
        }
    }
}
    
    
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Game())
    }
}
