//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jens Nikolaus on 1/22/23.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Sophie is my dog")
                .titleStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
