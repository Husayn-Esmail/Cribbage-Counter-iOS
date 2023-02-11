//
//  ContentView.swift
//  Cribbage Counter iOS
//
//  Created by Husayn Esmail on 2023-02-10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game = Game()
    var body: some View {
        NavigationView {
            VStack {
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Pick the number of players")
                HStack{
                    Button("2", action: { game.initPlayers(number: 2) }).padding(1.3)
                    Button("3", action: { game.initPlayers(number: 3) })
                }.buttonStyle(.borderedProminent)
                if game.Players != 0 {
                    NavigationLink("Start", destination: GameView().environmentObject(game)).buttonStyle(.borderedProminent)
                }
                Text("\(game.Players)")
                
                List {
                    ForEach(game.scores.sorted(by: >), id: \.key) { key, value in
                        Text("\(key) :     \(value)")
                    }
                }
            }
            .padding()
        }
    }
    
    
}


class Game: ObservableObject {
    @Published var Players: Int = 0;
    @Published var scores: [String: Int] = [:];
    func resetScores() {
        scores = [:]
    }
    
    func populateScores(players: Int) {
        resetScores()
        var counter: Int = 0;
        while (counter != players) {
            scores["Player\(counter+1)"] = 0
            counter += 1
        }
    }
    
    func initPlayers(number: Int) {
        Players = number
        populateScores(players: Players)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Game())
    }
}
