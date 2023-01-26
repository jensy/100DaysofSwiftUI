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
    @State private var score = 0
    @State private var round = 0
    
    let rock = "🪨"
    let paper = "📄"
    let scissors = "✂️"
    
    @State private var shapes = ["🪨", "📄", "✂️"].shuffled()
    @State private var currentShape = Int.random(in: 0...2)
    @State private var winOrLose = Bool.random()
    
    @State private var showingHighscore = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                VStack {
                    Text("\(shapes[currentShape])")
                        .font(.system(size: 200))
                        .shadow(radius: 40)
                }
                
                Spacer()
                
                Text(winOrLose ? "Win the game" : "Lose the game")
                    .font(.title)
                    .frame(height: 40)
                
                HStack(spacing: 20) {
                    Button {
                        choiceTapped(rock)
                    } label: {
                        Text(rock)
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .buttonStyle(.bordered)
                    Button {
                        choiceTapped(paper)
                    } label: {
                        Text(paper)
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .buttonStyle(.bordered)
                    Button {
                        choiceTapped(scissors)
                    } label: {
                        Text(scissors)
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .buttonStyle(.bordered)
                }
                .padding(20)
                
                Spacer()
                
                VStack {
                    Text("Score: \(score)")
                        .frame(minHeight: 60)
                        .font(.headline)
                    
                }
            }
            .navigationTitle("Rock, paper, scissors")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("Congratulations!", isPresented: $showingHighscore) {
            Button("Play again", action: resetGame)
        } message: {
            Text("Your score: \(score)")
        }
    }
    
    func shuffleShapes() {
        shapes.shuffle()
        currentShape = Int.random(in: 0...2)
    }
    
    func choiceTapped(_ choice: String) {
        if winOrLose == true {
            if shapes[currentShape].contains(rock) {
                if choice == rock {
                    score -= 1
                } else if choice == paper {
                    score += 1
                } else if choice == scissors {
                    score -= 1
                }
            }
            
            if shapes[currentShape].contains(paper) {
                if choice == rock {
                    score -= 1
                } else if choice == paper {
                    score -= 1
                } else if choice == scissors {
                    score += 1
                }
            }
            
            if shapes[currentShape].contains(scissors) {
                if choice == rock {
                    score += 1
                } else if choice == paper {
                    score -= 1
                } else if choice == scissors {
                    score -= 1
                }
            }
        } else if winOrLose == false {
            if shapes[currentShape].contains(rock) {
                if choice == rock {
                    score += 1
                } else if choice == paper {
                    score -= 1
                } else if choice == scissors {
                    score += 1
                }
            }
            
            if shapes[currentShape].contains(paper) {
                if choice == rock {
                    score += 1
                } else if choice == paper {
                    score += 1
                } else if choice == scissors {
                    score -= 1
                }
            }
            
            if shapes[currentShape].contains(scissors) {
                if choice == rock {
                    score -= 1
                } else if choice == paper {
                    score += 1
                } else if choice == scissors {
                    score += 1
                }
            }
        }
        
        shuffleShapes()
        winOrLose.toggle()
        
        round += 1
        if round == 10 {
            showingHighscore = true
        }
    }
    
    func resetGame() {
        round = 0
        score = 0
        
        shuffleShapes()
        winOrLose.toggle()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
