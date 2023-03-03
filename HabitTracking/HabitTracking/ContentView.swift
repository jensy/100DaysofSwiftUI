//
//  ContentView.swift
//  HabitTracking
//
//  Created by Jens Nikolaus on 3/3/23.
//
//  Define a struct that holds a single activity, and a class that holds an array of activities.
//  The class will need to conform to ObservableObject and use @Published for its property.
//  Your main listing and form should both be able to read the shared activities object.
//  Make sure your activity conforms to Identifiable to avoid problems.
//  Present your adding form using sheet(), and your activity detail view (if you add one) using NavigationLink.

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
