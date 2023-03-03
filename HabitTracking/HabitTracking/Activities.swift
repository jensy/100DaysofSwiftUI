//
//  Activities.swift
//  HabitTracking
//
//  Created by Jens Nikolaus on 3/3/23.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities = [Activity]()
    
    let exampleActivities = [
        Activity(id: UUID(), trackedDate: Date.now, name: "Swift", description: "Learning SwiftUI", count: 1),
        Activity(id: UUID(), trackedDate: Date.now, name: "Drink water", description: "At least 6 glasses of water a day", count: 3),
        Activity(id: UUID(), trackedDate: Date.now, name: "Spreadsheet day", description: "Once a month", count: 0),
        Activity(id: UUID(), trackedDate: Date.now, name: "Portuguese", description: "Once a day", count: 0)
    ]
    
    init() {
        self.activities = exampleActivities
    }
}
