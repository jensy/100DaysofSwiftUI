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

//  To-dos
//  Reset TextField on submit
//  Add some fun to this

import SwiftUI

struct CustomColor {
    static let peach = Color("peach")
}

struct ContentView: View {
    @State private var settingsMode = true
    @State private var gameMode = false
    @State private var scoreMode = false
    
    @State private var questions = [5, 10, 20]
    @State private var questionSelection = 1
    @State private var questionsAsked = 0
    
    @State private var multiplicationTable = 2
    @State private var randomNumber = Int.random(in: 0...12)
    @State private var correctAnswer = 0
    @State private var guess = 0
    
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //  Settings
                VStack {
                    Stepper(value: $multiplicationTable, in: 2...12, step: 1) {
                        Text("Multiplication table: \(multiplicationTable)")
                    }
                    
                    Section {
                        Picker("How many questions?", selection: $questionSelection) {
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
                .opacity(settingsMode ? 1 : 0) //   1 : 0
                
                Spacer()
                
                //  Game mode
                VStack {
                    Form {
                        Text("What is \(randomNumber) x \(multiplicationTable)?")
                        
                        Section("Your guess") {
                            TextField("", value: $guess, format: .number)
                                .keyboardType(.decimalPad)
                        }
                    }
                    .frame(maxHeight: 220)
                    
                    Button {
                        checkGuess()
                    } label: {
                        Text("Check")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.primary)
                    
                    Text("Score: \(score)")
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
                    
                    Button {
                        settingsMode = true
                        scoreMode = false
                        score = 0
                        guess = 0
                    } label: {
                        Text("Restart game")
                    }
                        
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(CustomColor.peach)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .opacity(scoreMode ? 1 : 0)
                
            }
            .padding(20)
            .navigationTitle("Multiply Game")
        }
    }
    
    func startGame() {
        //  Start game switches on gameMode
        settingsMode = false
        gameMode = true
        
        questionsAsked = 1
        correctAnswer = randomNumber * multiplicationTable
    }
    
    func checkGuess() {
        if questionsAsked < questions[questionSelection] {
            if guess == correctAnswer {
                score += 1
            } else {
                score -= 1
            }
            
            randomNumber = Int.random(in: 0...12)
            correctAnswer = randomNumber * multiplicationTable
            
            questionsAsked += 1
            guess = 0
        } else {
            if guess == correctAnswer {
                score += 1
            } else {
                score -= 1
            }
            showScoreCard()
        }
    }
    
    func showScoreCard() {
        gameMode = false
        scoreMode = true
        
        //  Let user restart game
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
