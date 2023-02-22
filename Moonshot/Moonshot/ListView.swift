//
//  ListView.swift
//  Moonshot
//
//  Created by Jens Nikolaus on 2/21/23.
//

import SwiftUI

struct ListView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        Text(mission.displayName)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .preferredColorScheme(.dark)
    }
}
