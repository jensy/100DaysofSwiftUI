//
//  AddActivityView.swift
//  HabitTracking
//
//  Created by Jens Nikolaus on 3/3/23.
//

import SwiftUI

struct AddActivityView: View {
    @State private var name = "Portuguese"
    @State private var description = "10 minutes every day"
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Habit") {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Create") {
                    //  Append activity
                    dismiss()
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
