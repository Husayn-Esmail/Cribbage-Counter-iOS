//
//  RedWinsView.swift
//  Cribbage Counter WatchOS Watch App
//
//  Created by Husayn Esmail on 2023-02-11.
//

import SwiftUI

// if red wins
struct RedWinsView: View {
    @ObservedObject var scores = Counters.shared
    var body: some View {
        VStack {
            Text("Red Wins!")
                .foregroundColor(.red)
            Text("\(scores.scores.redScore)")
            Button(action:{scores.scores.blueScore = 0; scores.scores.redScore = 0;}, label: {Text("Reset")
            })
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}


struct RedWinsView_Previews: PreviewProvider {
    static var previews: some View {
        RedWinsView()
    }
}
