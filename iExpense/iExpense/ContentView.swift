//
//  ContentView.swift
//  iExpense
//
//  Created by Jens Nikolaus on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
     
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter { $0.type.contains("Personal") }) { item in
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
                    .onDelete(perform: removeItems)
                }
                
                Section("Business") {
                    ForEach(expenses.items.filter { $0.type.contains("Business") }) { item in
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
                    .onDelete(perform: removeItems)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
        
        //  This is not working anymore because something does not match
        //  Probably the index, do I need a different identifier? RowIndex?
        //  Alternatively, save data in different structs: PersonalExpenses, BusinessExpenses
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
