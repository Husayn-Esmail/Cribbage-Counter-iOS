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
                Button("name player", action: {game.set_player_name(name: "player")})
                Button("increase score", action: {game.increasePlayerScore(number: 3)})
                Text("\(game.player.name): \(game.player.score)")
                Text("x and y")
                Text("\(game.x.name) : \(game.x.score)")
                Text("\(game.y.name): \(game.y.score)")
                Button("increase x", action: {game.x.increaseScore(number: 2)})
                Button("increase y", action: {game.y.increaseScore(number: 2)})
            }
        }
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Game())
    }
}
