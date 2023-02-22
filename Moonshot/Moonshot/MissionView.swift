//
//  MissionView.swift
//  Moonshot
//
//  Created by Jens Nikolaus on 2/18/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate)
                        .padding(.top, 5)
                        .font(.subheadline)
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.bottom)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { CrewMember in
                                NavigationLink {
                                    AstronautView(astronaut: CrewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(CrewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .overlay(
                                                Rectangle()
                                                    .strokeBorder(.foreground, lineWidth: 1)
                                            )
                                        
                                        VStack(alignment: .leading) {
                                            Text(CrewMember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            Text(CrewMember.role)
                                                .foregroundColor(CrewMember.role == "Command Pilot" ? .indigo : .secondary)
                                                .font(CrewMember.role == "Command Pilot" ? .body.bold() : .body)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
