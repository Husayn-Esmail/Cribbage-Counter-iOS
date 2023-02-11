//
//  BlueWinsView.swift
//  Cribbage Counter WatchOS Watch App
//
//  Created by Husayn Esmail on 2023-02-11.
//

import SwiftUI

// if blue wins
struct BlueWinsView: View {
    @ObservedObject var scores = Counters.shared
    var body: some View {
        VStack {
        Text("Blue Wins!")
            .foregroundColor(.blue)
            Text("\(scores.scores.blueScore)")
        Button(action:{scores.scores.blueScore = 0; scores.scores.redScore = 0;}, label: {Text("Reset")
        })
        .background(Color.gray)
        .cornerRadius(10)
        }
    }
}

struct BlueWinsView_Previews: PreviewProvider {
    static var previews: some View {
        BlueWinsView()
    }
}
