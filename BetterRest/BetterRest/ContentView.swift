//
//  ContentView.swift
//  BetterRest
//
//  Created by Jens Nikolaus on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Text(Date.now, format: .dateTime.hour().minute().month().day())
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }
    
    func trivialExample() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date.now
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
