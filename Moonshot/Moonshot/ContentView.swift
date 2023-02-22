//
//  ContentView.swift
//  Moonshot
//
//  Created by Jens Nikolaus on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = true
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridView()
                } else {
                    ListView()
                }
            }
            .padding(.top, 10)
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        Image(systemName: showingGrid ? "list.star" : "square.grid.2x2")
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
