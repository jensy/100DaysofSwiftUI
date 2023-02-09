//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jens Nikolaus on 1/18/23.
//

import SwiftUI

struct FlagImage: View {
    var countries = [String]()
    var number: Int
    
    var body: some View {
        Image(countries[number])
            .renderingMode(.original)
            .cornerRadius(2)
            .shadow(radius: 8)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingReset = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var roundCount = 1
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var animationAmount = 0.0
    
    @State private var selectedFlag = 0
    @State private var animateCorrect = 0.0
    @State private var animateOpacity = 1.0
    @State private var nextToCorrect = false
    @State private var nextToWrong = false
    
    
    var body: some View {
        ZStack() {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            
                .ignoresSafeArea()

            VStack() {
                Spacer()
                Spacer()
                
                Text("Guess the Flag")
                    .titleStyle()
                
                Spacer()
                
                VStack(spacing: 20) {
                    VStack() {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3, id: \.self) { number in
                        Button {
                            self.flagTapped(number)
                            self.selectedFlag = number
                            
                        } label: {
                            FlagImage(countries: countries, number: number)
                        }
                        .rotation3DEffect(.degrees(number == self.correctAnswer ? self.animateCorrect : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(number != self.correctAnswer && self.nextToCorrect ? self.animateOpacity : 1)
                        
                        .rotationEffect(self.nextToWrong && self.selectedFlag == number ? .degrees(6) : .degrees(0))
                        .opacity(self.nextToWrong && self.selectedFlag != number ? self.animateOpacity : 1)
                                                
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                Spacer()
            }

        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Score: \(score)")
        }
        .alert(scoreTitle, isPresented: $showingReset) {
            Button("Restart the game", action: resetGame)
        } message: {
            Text(score >= 6 ? "Your final score is: \(score) \nWell done!" : "Your final score is: \(score) \nBetter work on your flags…" )
        }
    }
    
    func flagTapped(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct!"
                score += 1
                roundCount += 1
                withAnimation {
                    self.animateCorrect += 360
                    self.animateOpacity = 0.25
                    self.nextToCorrect = true
                }
            } else if number != correctAnswer {
                scoreTitle = "Wrong, sorry! This is the flag of \(countries[number])"
                score -= 1
                roundCount += 1
                withAnimation {
                    self.animateOpacity = 0.25
                    self.nextToWrong = true
                }
            }
        
            if roundCount <= 8 {
                showingScore = true
            } else {
                showingReset = true
            }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        nextToCorrect = false
        nextToWrong = false
    }
    
    func resetGame() {
        roundCount = 1
        score = 0
        
        askQuestion()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
