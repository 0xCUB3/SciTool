//
//  Models.swift
//  SciTool
//
//  Created by Alexander Skula on 7/19/24.
//

import Foundation

struct Compound: Identifiable {
    let id = UUID()
    let name: String
    let formula: String
}

// Add sample data for compounds
let compounds: [Compound] = [
    Compound(name: "Water", formula: "H2O"),
    Compound(name: "Carbon Dioxide", formula: "CO2"),
    // Add more compounds...
]
