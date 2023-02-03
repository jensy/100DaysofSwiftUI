//
//  ContentView.swift
//  Animations
//
//  Created by Jens Nikolaus on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.8
    
    var body: some View {
        VStack {
            Button("Tap me") {
            }
                .padding(50)
                .background(.mint)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                    .stroke(.mint)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1.2)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
                )
                .onAppear {
                    animationAmount = 2
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
