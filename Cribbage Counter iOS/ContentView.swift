//
//  ContentView.swift
//  Cribbage Counter iOS
//
//  Created by Husayn Esmail on 2023-02-10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game: Game = Game()
    //    @ var lists: [Player] = []
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Pick the number of players").font(.title).fontWeight(.semibold).padding(1.5)
//                number of player options available for the game
                HStack {
                    Button("2", action: { game.createPlayers(number: 2) })
                    Button("3", action: { game.createPlayers(number: 3) })
                }
                
//                only show start button once players have been created
                if game.players.count != 0 {
                    NavigationLink("Start"){ GameView().environmentObject(game) }
                }
            }.buttonStyle(.borderedProminent)
        }
    }
}

// use this for custom types
struct Player {
    let id: Int;
    let name: String;
    var score: Int;
    
    mutating func changeScore(number: Int) {
        score += number
    }
}

class Game: ObservableObject {
    @Published var players: [Player?] = []
    
    
//    generic function to create number of players requested
    func createPlayers(number: Int) {
//        reset players
        players = []
//        create new players
        for i in Range(0...number-1) {
            let new_player = Player(id: i, name: "Player \(i+1)", score: 0)
            players.append(new_player)
        }
    }
    
    func resetGame() {
        for var player in players {
            if player != nil {
                player?.score = 0
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Game())
    }
}
