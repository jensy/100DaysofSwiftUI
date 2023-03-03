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
    @State private var activities: [Activity] = [
        Activity(id: UUID(), trackedDate: Date.now, name: "Swift", description: "Learning SwiftUI", count: 1),
        Activity(id: UUID(), trackedDate: Date.now, name: "Drink water", description: "At least 6 glasses of water a day", count: 3),
        Activity(id: UUID(), trackedDate: Date.now, name: "Spreadsheet day", description: "Once a month", count: 0),
        Activity(id: UUID(), trackedDate: Date.now, name: "Portuguese", description: "Once a day", count: 0)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(activities) { activity in
                    HStack {
                        Text(activity.name)
                        Spacer()
                        Text(activity.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
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
