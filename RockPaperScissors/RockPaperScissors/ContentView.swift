//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jens Nikolaus on 1/25/23.
//

// 🪨 📄 ✂️

//  Each turn of the game the app will randomly pick either rock, paper, or scissors.
//  Each turn the app will alternate between prompting the player to win or lose.
//  The player must then tap the correct move to win or lose the game.
//  If they are correct they score a point; otherwise they lose a point.
//  The game ends after 10 questions, at which point their score is shown.

import SwiftUI

struct ContentView: View {
    let shapes = ["🪨", "📄", "✂️"]
    var score = 0
    
    @State private var currentShape = "✂️"
    @State private var winOrLose = Bool.random()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Rock, paper, scissors")
                Text(winOrLose ? "Win" : "Lose")
                    .font(.title)
                    .frame(height: 40)
                
                Spacer()
                
                VStack {
                    Text("\(shapes[0])")
                        .font(.system(size: 200))
                        .shadow(radius: 40)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        Text("🪨")
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .buttonStyle(.bordered)
                    Button {
                        
                    } label: {
                        Text("📄")
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .buttonStyle(.bordered)
                    Button {
                        
                    } label: {
                        Text("✂️")
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .buttonStyle(.bordered)
                }
                .padding(20)
                
                
                Spacer()
                
                VStack {
                    Text("Player score: \(score)")
                        .font(.headline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
