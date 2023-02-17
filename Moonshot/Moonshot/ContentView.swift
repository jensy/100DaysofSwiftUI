//
//  ContentView.swift
//  Moonshot
//
//  Created by Jens Nikolaus on 2/16/23.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Sophie Noodle",
                    "address": {
                        "street": "555, Bean Soup Rd",
                        "city": "Fort Collins"
                    }
                }
                """
                
                let data = Data(input.utf8)
                
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    print(user.address.street)
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
