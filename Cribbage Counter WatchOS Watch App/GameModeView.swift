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
        NavigationStack {
            VStack {
                Text("Game Mode:")
                
                NavigationLink("121 Points"){ o21PointView() }
                NavigationLink("61 Point"){ s1PointView() }
            }
        }
    }
}

struct GameModeView_Previews: PreviewProvider {
    static var previews: some View {
        GameModeView()
    }
}
