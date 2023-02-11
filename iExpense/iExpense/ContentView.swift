//
//  ContentView.swift
//  iExpense
//
//  Created by Jens Nikolaus on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        VStack {
            Button("Sophie Noodle barks \(tapCount) times") {
                tapCount += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
