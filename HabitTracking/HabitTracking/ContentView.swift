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
    @ObservedObject var activities = Activities()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink {
                        ActivityView()
                    } label: {
                        HStack {
                            Text("Portuguese")
                            Spacer()
                            Text("10 minutes every day")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    //  activities.activities?!
                    ForEach(activities.activities) { activity in
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
            .navigationTitle("Habits")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //  Code
                    } label: {
                        Image(systemName: "plus")
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
