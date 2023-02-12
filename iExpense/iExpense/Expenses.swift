//
//  Expenses.swift
//  iExpense
//
//  Created by Jens Nikolaus on 2/12/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
