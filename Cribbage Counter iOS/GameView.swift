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
//                    scores
                    ForEach(game.scores.sorted(by: <), id: \.key) { player, score in
                        HStack {
                            Text("\(player) :     \(score)")
                            Text("\(player)")
                        }
                        
                    }
                    one().environmentObject(game)
                    two().environmentObject(game)
                    three().environmentObject(game)
                    four().environmentObject(game)
                    five().environmentObject(game)
                }.padding().buttonStyle(.borderedProminent)
            }
        }
    }
}

struct one: View {
    @EnvironmentObject var game: Game
    var body: some View {
        HStack {
            ForEach(game.scores.sorted(by: <), id: \.key) {player, score in
                HStack {
                    if (game.scores[player] ?? 0 > 0) {
                        Button("-", action: {game.incrementScore(playerName: player, number: -1)})
                    }
                    Button("+", action: {game.incrementScore(playerName: player, number: 1)})
                }
            }
        }
    }
}

struct two: View {
    @EnvironmentObject var game: Game
    var body: some View {
        HStack  {
            ForEach(game.scores.sorted(by: <), id: \.key) {player,score in
                VStack{
                    Button("run (3)", action : {game.incrementScore(playerName: player, number: 3)})
                    Button("run (4)", action: {game.incrementScore(playerName: player, number: 4)})
                    Button("run (5)", action: {game.incrementScore(playerName: player, number: 5)})
                }
            }
        }
    }
}

struct three: View {
    @EnvironmentObject var game: Game
    var body: some View {
        HStack {
//                    pairs and triplets
            ForEach(game.scores.sorted(by: <), id: \.key) {
            player, score in
                VStack {
                    Button("Pair", action: { game.incrementScore(playerName: player, number: 2)})
                    Button("Triplet", action: {
                        game.incrementScore(playerName: player, number: 6)
                    })
                }
            }
        }
    }
}

struct four: View {
    @EnvironmentObject var game: Game
    var body: some View {
        HStack {
            ForEach(game.scores.sorted(by: <), id: \.key) {
                player, score in
                VStack {
                    Button("Four", action :{game.incrementScore(playerName: player, number: 12)})
                    Button("Go", action: {game.incrementScore(playerName: player, number: 1)})
                }
            }
        }
    }
}

struct five: View {
    @EnvironmentObject var game: Game
    var body: some View {
        HStack {
            ForEach(game.scores.sorted(by: <), id: \.key) { player, score in
//                        counter += 1
                HStack {
                    VStack {
                        Button("His Knobs", action: {game.incrementScore(playerName: player, number: 1)})
                        Button("His Heels", action: {game.incrementScore(playerName: player, number: 2)})
                        Button("Flush", action: {game.incrementScore(playerName: player, number: 4)})
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
