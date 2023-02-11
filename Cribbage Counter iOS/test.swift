//
//  test.swift
//  Cribbage Counter iOS
//
//  Created by Husayn Esmail on 2023-02-10.
//

import SwiftUI

struct test: View {
    @EnvironmentObject var game: Game
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(" players: \(game.Players)")
            List {
                ForEach(game.scores.sorted(by: >), id: \.key) { key, value in
                    Text("\(key) :     \(value)")
                }
            }
            
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test().environmentObject(Game())
    }
}
