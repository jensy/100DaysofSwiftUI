//
//  ContentView.swift
//  ConversionApp
//
//  Created by Jens Nikolaus on 1/16/23.
//

//  Length conversion app: users choose meters, kilometers, feet, yards, or miles.
//  Do not understand how to hide the divider between segmented controller and textfield, as well as rounding corners on it
//  Found a different solution using tags: https://developer.apple.com/documentation/swiftui/picker

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var unit = "Feet"
    @State private var unitOutput = "Meters"
    
    @State private var unitSelector = 0
    @State private var unitSelectorOutput = 0
    
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    let unitsToMeters = [1, 1000, 0.3048, 0.9144, 1609.34]
    let metersToUnits = [1, 0.001, 3.28084, 1.09361, 0.000621371]
    
    var toMeters: Double {
        let meters = Double(input * unitsToMeters[unitSelector])

        return meters
    }

    var convertLength: Double {
        let length = Double(toMeters * metersToUnits[unitSelectorOutput])

        return length
    }
    
    @FocusState private var inputIsFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input", selection: $unitSelector) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(self.units[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                    .listRowInsets(.init())
                    .listRowBackground(Color(.systemBackground))
                                        
                    TextField("Amount", value: $input, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($inputIsFocused)
                }
                
                Section {
                    Picker("Input", selection: $unitSelectorOutput) {
                        ForEach(0..<units.count, id: \.self) {
                            Text(self.units[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                    .listRowInsets(.init())
                    .listRowBackground(Color(.systemBackground))
                    
                    Text(convertLength, format: .number)
                }
            }
            .navigationTitle("Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
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
