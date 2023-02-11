//
//  ContentView.swift
//  Cribbage Counter iOS
//
//  Created by Husayn Esmail on 2023-02-10.
//

import SwiftUI

struct ContentView: View {
    @State var Players: Int = 0;
    @State var scores: [String: Int] = [:];
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Pick the number of players")
            Button("2", action: two_players);
            Button("3", action: three_players)
            Text("\(Players)")
            List {
                ForEach(scores.sorted(by: >), id: \.key) { key, value in
                    Text("\(key):\(value)")
                }
            }
        
            
        }
        .padding()
    }
    
    func populateScores(players: Int) {
        var counter: Int = 0;
        while (counter != players) {
            scores["Player\(counter+1)"] = 0
            counter += 1
        }
    }
    
    func two_players() {
        Players = 2
        populateScores(players: Players)
    }
    func three_players() {
        Players = 3;
        populateScores(players: Players)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
