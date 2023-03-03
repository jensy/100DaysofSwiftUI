//
//  Activity.swift
//  HabitTracking
//
//  Created by Jens Nikolaus on 3/3/23.
//

import Foundation

struct Activity: Codable, Identifiable {
    let id: UUID
    let trackedDate: Date?
    let name: String
    let description: String
    let count: Int
}
