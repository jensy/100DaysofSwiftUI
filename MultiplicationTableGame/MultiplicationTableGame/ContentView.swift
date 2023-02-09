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

struct ContentView: View {
    @State private var multiplicationTable = 2
    @State private var questions = [5, 10, 20]
    
    var body: some View {
        NavigationView {
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
                    
                } label: {
                    Text("Start game")
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
            }
            .padding(20)
            .navigationTitle("Mutiply Game")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
