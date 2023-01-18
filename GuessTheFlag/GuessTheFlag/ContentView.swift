//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jens Nikolaus on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Spacer()
            
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            Button {
                print("Button was pressed")
            } label: {
                Label("Like", systemImage: "heart")
            }
            
            Spacer()
            Button("Delete selection", role: .destructive, action: Delete)
        }
    }
    
    func Delete() {
       print("Now deleting")
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
