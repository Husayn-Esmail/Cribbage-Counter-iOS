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
                Text("press the buttons")
                Text("x and y")
                if let x = game.players[0] {
                    Text("\(x.name) : \(x.score)")
                }
                
                if game.players[0] != nil {
                    Button("decrease first", action:
                            {game.players[0]?.changeScore(number: -1)})
                    Button("increase first", action:
                            {game.players[0]?.changeScore(number: 1)})
                }
                Text("\(game.players.count)")
                List {
                    HStack {
                        ForEach(game.players, id: \.?.name) {
                            player in
                            if let validPlayer = player {
                                Text("\(validPlayer.name): \(validPlayer.score)")
                            }
                        }
                    }
                    
                    HStack {
                        ForEach(game.players, id: \.?.name) {
                            player in
                            VStack {
                                if let validPlayer = player {
                                    Button("increase x", action: {game.players[validPlayer.id]?.changeScore(number: 2)})
                                    if validPlayer.score > 0 {
                                        Button("decrease x", action: {game.players[validPlayer.id]?.changeScore(number: -2)})
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }.buttonStyle(.borderedProminent)
    }
}
    
    
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Game())
    }
}
