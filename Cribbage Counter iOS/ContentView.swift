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
                Button("create player", action: {game.make_player()})
                Button("setname game", action: {game.set_player_name(name: "player")})
                Button("create xy", action: {game.makePPlayer()})
                NavigationLink("Start"){ GameView().environmentObject(game)
                }
            }.buttonStyle(.borderedProminent)
        }
    }
}

// use this for custom types
struct PPlayer {
    var score: Int;
    let name: String;
    let id: Int;
    
    mutating func increaseScore(number: Int) {
        score += number
    }
}

class Game: ObservableObject {
    @Published var player: Player!
    @Published var x: PPlayer!
    @Published var y: PPlayer!
    
    func makePPlayer() {
        x = PPlayer(score:0, name:"plaeyrs", id:1)
        y = PPlayer(score:0, name: "player2", id:2)
    }
    
    func increasep1(number: Int) {
        x.score += number
    }
    
    func increaseP2(number: Int) {
        y.score += number
    }
    
    func make_player() {
        player = Player()
    }
    
    func set_player_name(name: String) {
        player.name = name
    }
    
    func increasePlayerScore(number: Int) {
        player.score += number
    }
}

//class Player: ObservableObject {
//    @Published var score: Int = 0;
//    @Published var name: String = ""
//    let identifier = UUID()
//
//    func increaseScore(number: Int) {
//        score += number
//    }
//
//    func decreaseScore(number: Int) {
//        score -= number
//    }
//
//    func setName(new_name: String) {
//        name = new_name
//    }
//}

class Player {
    var score: Int = 0;
    var name: String = ""
    let identifier = UUID()
    
    func increaseScore(number: Int) {
        score += number
    }

    func decreaseScore(number: Int) {
        score -= number
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Game())
    }
}
