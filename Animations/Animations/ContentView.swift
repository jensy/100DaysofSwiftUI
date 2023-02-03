//
//  ContentView.swift
//  Animations
//
//  Created by Jens Nikolaus on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Button("Tap me") {
                animationAmount += 0.4
            }
                .padding(50)
                .background(.mint)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .blur(radius: (animationAmount-1) * 3)
                .animation(.default, value: animationAmount)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
