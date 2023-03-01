//
//  ContentView.swift
//  Drawing
//
//  Created by Jens Nikolaus on 2/22/23.
//

import SwiftUI

struct Arrow: Shape {
    var strokeWidth: Double
    
    var animatableData: Double {
        get { strokeWidth }
        set { strokeWidth = newValue }
    }
    
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

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                                gradient: Gradient(colors: [
                                    color(for: value, brightness: 1),
                                    color(for: value, brightness: 0.5)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 2
                    )
            }
        }
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var strokeWidth = 10.0
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            Arrow(strokeWidth: strokeWidth)
                .stroke(.indigo, lineWidth: strokeWidth)
                .onTapGesture {
                    withAnimation {
                        strokeWidth = Double.random(in: 10...50)
                    }
                }
            
            VStack {
                ZStack {
                    ColorCyclingRectangle(amount: colorCycle)
                        .frame(width: 300, height: 300)
                }
                .drawingGroup()
                
                Slider(value: $colorCycle)
            }
            .padding(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
