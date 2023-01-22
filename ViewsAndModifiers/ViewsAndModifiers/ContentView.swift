//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jens Nikolaus on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
                .font(.system(size: 48))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
