//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jens Nikolaus on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(stops: [
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55)
            ]), startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
