//
//  ContentView.swift
//  Animations
//
//  Created by Jens Nikolaus on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Button("Hi, Sophie") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .mint)
            .animation(nil, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 100 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
