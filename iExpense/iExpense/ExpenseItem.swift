//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jens Nikolaus on 2/12/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
