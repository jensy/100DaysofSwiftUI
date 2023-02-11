//
//  ContentView.swift
//  iExpense
//
//  Created by Jens Nikolaus on 2/11/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Sophie"
    @Published var lastName = "Noodle"
}

struct ContentView: View {
    //  Creating data for first time. Reading or modifying data, use @ObservedObject instead
    @StateObject var user = User()
    
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
