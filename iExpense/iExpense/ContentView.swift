//
//  ContentView.swift
//  iExpense
//
//  Created by Jens Nikolaus on 2/11/23.
//

import SwiftUI

struct User {
    var firstName = "Sophie"
    var lastName = "Noodle"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)!")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
