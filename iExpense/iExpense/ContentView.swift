//
//  ContentView.swift
//  iExpense
//
//  Created by Jens Nikolaus on 2/11/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss", role: .destructive) {
            dismiss()
        }
        .buttonStyle(.borderedProminent)

    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Button("Show Sophie Noodle") {
                showingSheet.toggle()
            }
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Sophie, woof")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
