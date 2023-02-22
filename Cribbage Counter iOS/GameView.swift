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
                                if let validPlayer = player {
                                    let twoPlayer = game.players.count == 2
    //                                  these are broken up this way so that the app compiles
                                    if twoPlayer {
                                        let conditionOne = validPlayer.id == 0
                                        if conditionOne  {
                                            Spacer()
                                        }
                                    } else {
                                        let conditionOne = validPlayer.id == 0
                                        let conditionTwo = validPlayer.id == 1
                                        let conditionThree = conditionOne || conditionTwo
                                        if conditionThree {
                                            Spacer()
                                        }
                                    }
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
                                    Group {
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
                                    
                                        //                                    flushes
                                        Text("Flushes")
                                    }.tint(validPlayer.color)
                                    HStack {
                                        Button("5", action: {game.players[validPlayer.id]?.changeScore(number:4)} )
                                        Button("4", action: {game.players[validPlayer.id]?.changeScore(number: 5)})
                                    }.tint(validPlayer.color)
                                    
                                }
                            }
                            
                            if let validPlayer = player {
                                let twoPlayer = game.players.count == 2
//                                check condition
                                if twoPlayer {
                                    let conditionOne = validPlayer.id == 0
                                    if conditionOne  {
                                        Spacer()
                                    }
                                } else {
                                    let conditionOne = validPlayer.id == 0
                                    let conditionTwo = validPlayer.id == 1
                                    let conditionThree = conditionOne || conditionTwo
                                    if conditionThree {
                                        Spacer()
                                    }
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
