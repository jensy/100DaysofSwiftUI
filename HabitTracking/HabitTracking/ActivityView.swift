//
//  ActivityView.swift
//  HabitTracking
//
//  Created by Jens Nikolaus on 3/3/23.
//

import SwiftUI

struct ActivityView: View {
    var activities = Activities()
    let activity: Activity
    
    var body: some View {
        Text("Portuguese")
    }
    
//    init(activity: Activity, activities: [Activity]) {
//        self.activity = activity
//    }
}

struct ActivityView_Previews: PreviewProvider {
    static let activities = Activities()
    
    static var previews: some View {
        ActivityView(activity: activities.activities[0])
    }
}
