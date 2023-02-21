//
//  ContentView.swift
//  Cribbage Counter WatchOS Watch App
//
//  Created by Husayn Esmail on 2023-02-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GameModeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
