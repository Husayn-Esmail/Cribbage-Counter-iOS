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
                    Text("\(value) \(key)")
                }
            }
        
            
        }
        .padding()
    }
    
    func two_players() {
        Players = 2
        scores["Player1"] = 0;
        scores["Player2"] = 0;
    }
    func three_players() {
        two_players()
        scores["Player3"] = 0;
        Players += 1;
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
