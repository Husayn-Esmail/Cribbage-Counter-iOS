//
//  GameModeView.swift
//  Cribbage Counter WatchOS Watch App
//
//  Created by Husayn Esmail on 2023-02-11.
//

import SwiftUI

struct GameModeView: View {
    @State var points121 = false
    @State var points61 = false
    @ObservedObject var scores = Counters.shared;
    var body: some View {
        VStack {
            Text("Game Mode:")
            NavigationLink(destination: o21PointView(), isActive: $points121){
                Button(action: {self.points121 = true; scores.scores.blueScore = 0;
                        scores.scores.redScore = 0;}, label: {
                    Text("121 Points")
                })
            }
            NavigationLink(destination: s1PointView(), isActive: $points61){
                Button(action: {self.points61 = true; scores.scores.blueScore = 0;
                        scores.scores.redScore = 0;}, label: {
                    Text("61 Points")
                })
            }
        }
    }
}

struct GameModeView_Previews: PreviewProvider {
    static var previews: some View {
        GameModeView()
    }
}
