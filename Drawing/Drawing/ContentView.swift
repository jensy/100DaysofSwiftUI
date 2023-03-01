//
//  ContentView.swift
//  Drawing
//
//  Created by Jens Nikolaus on 2/22/23.
//

import SwiftUI

struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 150, y: 200))
        path.addLine(to: CGPoint(x: 250, y: 200))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.closeSubpath()
        
        return path
    }
}

struct ContentView: View {
    @State private var strokeWidth = 10.0
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(.indigo, lineWidth: strokeWidth)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
