//
//  Activities.swift
//  HabitTracking
//
//  Created by Jens Nikolaus on 3/3/23.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
     init() {
         if let activities = UserDefaults.standard.data(forKey: "Activities") {
             let decoder = JSONDecoder()
             if let decoded = try? decoder.decode([Activity].self, from: activities) {
                 self.activities = decoded
                 return
             }
         }

         self.activities = []
     }
 }
