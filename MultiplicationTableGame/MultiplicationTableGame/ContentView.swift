//
//  ContentView.swift
//  MultiplicationTableGame
//
//  Created by Jens Nikolaus on 2/9/23.
//

//  Multiplication table game
//  Select which multiplication table to practice, 2-12
//  Select how many questions to ask: 5, 10, 20
//  Generate questions based on inputs
//  There is a "settings" view and a "game mode", as well as a "score card"
//  Show how many questions they got right, let them restart the game from there

import SwiftUI

struct CustomColor {
    static let peach = Color("peach")
}

struct ContentView: View {
    @State private var gameMode = false
    @State private var scoreMode = false
    
    @State private var multiplicationTable = 2
    @State private var questions = [5, 10, 20]
    @State private var answer = 35
    
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                //  Settings
                VStack {
                    Stepper(value: $multiplicationTable, in: 2...12, step: 1) {
                        Text("Multiplication table: \(multiplicationTable)")
                    }
                    
                    Section {
                        Picker("How many questions?", selection: $questions) {
                            ForEach(0..<questions.count, id: \.self) {
                                Text("\(self.questions[$0])")
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        HStack {
                            Text("How many questions?")
                            Spacer()
                        }
                    }
                    
                    Button {
                        withAnimation(
                            .easeInOut(duration: 0.8)
                            .delay(0.6)
                        ) {
                            startGame()
                        }
                    } label: {
                        Text("Start multiplying")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.primary)
                }
                .frame(maxHeight: gameMode ? 0 : .infinity)
                .opacity(gameMode ? 0 : 1) //   0 : 1
                
                Spacer()
                
                //  Game mode
                VStack {
                    Form {
                        Text("What is 7 x 5?")
                        
                        Section("Your answer") {
                            TextField("Your answer", value: $answer, format: .number)
                        }
                    }
                    
                    Button {
                        askQuestion()
                    } label: {
                        Text("Check answer")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.primary)
                }
                .opacity(gameMode ? 1 : 0) //   1 : 0
                
                // Score card
                VStack() {
                    Text("Final score")
                        .font(.title)
                    Text("\(score)")
                        .font(.system(size: 96))
                    
                    Text("Congratulations!")
                        .foregroundColor(.secondary)
                        
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(CustomColor.peach)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .opacity(scoreMode ? 1 : 0)
                
            }
            .padding(20)
            .navigationTitle("Mutiply Game")
        }
    }
    
    func startGame() {
        //  Start game switches on gameMode
        gameMode = true
        
        //  View: Sore card that shows final score and lets user restart game
    }
    
    func askQuestion() {
        //  Ask next question
        //  Game logic: Randomize questions based on settings inputs: ForEach questions { ForEach 0...12 x selected table }
        //  Game logic: Keep track of correct answers and save score
    }
    
    func showScorecard() {
        gameMode = false
        scoreMode = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
