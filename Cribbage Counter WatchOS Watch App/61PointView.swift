//
//  61PointView.swift
//  Cribbage Counter WatchOS Watch App
//
//  Created by Husayn Esmail on 2023-02-11.
//

import SwiftUI

struct s1PointView: View {
    @ObservedObject var scores = Counters.shared;
    @State var resetRequest: Bool = false;
    var body: some View {
        return Group  {
            if scores.scores.redScore == 61 {
                RedWinsView()
            } else if scores.scores.blueScore == 61 {
                BlueWinsView()
            } else {
                VStack {
                    HStack {
                        // display score labels
                        Text("Red")
                            .foregroundColor(.red)
                            .padding(20)
                        Text("Blue")
                            .padding(20)
                            .foregroundColor(.blue)
                    }
                    HStack {
                        // decrease score for red
                        Button(action: {if scores.scores.redScore != 0 {scores.scores.redScore -= 1}}, label: {
                            Text("-")
                                .font(.system(size: 23))
                        })
                        .background(Color.red)
                        .cornerRadius(20)
                        // increase score for red
                        Button(action: {if scores.scores.redScore != 61 {scores.scores.redScore += 1}}, label: {
                            Text("+")
                                .font(.system(size: 23))
                        })
                        .background(Color.red)
                        .cornerRadius(20)
                            // decrease score for blue
                        Button(action: {if scores.scores.blueScore != 0 {scores.scores.blueScore -= 1}}, label: {
                            Text("-")
                                .font(.system(size: 23))
                        })
                        .background(Color.blue)
                        .cornerRadius(20)
                        // increase score for blue
                        Button(action: {if scores.scores.blueScore != 61 {scores.scores.blueScore += 1}}, label: {
                            Text("+")
                                .font(.system(size: 23))
                        })
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    // display scores
                    HStack {
                        Text("\(scores.scores.blueScore)")
                            .offset(x:65, y: 0)
                            .frame(minWidth:0, maxWidth: 30, minHeight: 23, maxHeight: 23)
                        Text("\(scores.scores.redScore)")
                            .offset(x:-65, y: 0)
                            .frame(minWidth:0, maxWidth: 30, minHeight: 23, maxHeight: 23)
                    }
                    NavigationLink(destination: ResetConfirmationView(), isActive: $resetRequest){
                        Button(action: {resetRequest = true}, label: {
                            Text("Reset")
                        })
                    }
                
                }
            }
        }
    }
}

struct s1PointView_Previews: PreviewProvider {
    static var previews: some View {
        s1PointView()
    }
}

