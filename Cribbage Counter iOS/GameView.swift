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
            List {
//                displays the name and score of each player
                HStack {
                    ForEach(game.players, id: \.?.name) {
                        player in
                        if let validPlayer = player {
                            Text("\(validPlayer.name): \(validPlayer.score)")
                            Spacer()
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
                                Button("increase x", action: {game.players[validPlayer.id]?.changeScore(number: 2)})
//                                mutating valid player doesn't mutate original value so score doesn't get updated
//                                also player != nil causes errors so i can't access that directly either also player is immutable
//                                but the id corresponds to the player's location in the array so it works to access game.players
//                                after unwrapping using id as index
                                if validPlayer.score > 0 {
                                    Button("decrease x", action: {game.players[validPlayer.id]?.changeScore(number: -2)})
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
