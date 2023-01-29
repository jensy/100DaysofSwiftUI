//
//  ContentView.swift
//  WordScramble
//
//  Created by Jens Nikolaus on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    var dogs = ["Sophie", "Stellah", "Meve", "Gus"]
    
    var body: some View {
        NavigationView {
            List {
                Section("Dogs") {
                    ForEach(dogs, id: \.self) {
                        Text($0)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("WordScramble")
        }
    }
    
    func test() {
        let input = """
a
b
c
"""
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func test2() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
    
//    func loadFile() {
//        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
//            if let fileContents = try? String(contentsOf: fileURL) {
//                // we loaded the file into the string
//                fileContents
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
