//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Jens Nikolaus on 2/15/23.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void

    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }

                    Spacer()

                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .foregroundColor(item.amount >= 10 ? .red.opacity(1) : .red.opacity(0.5))
                        .fontWeight(item.amount >= 100 ? .semibold : .regular)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}
