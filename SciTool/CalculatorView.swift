//
//  CalculatorView.swift
//  SciTool
//
//  Created by Alexander Skula on 7/19/24.
//

import SwiftUI

struct CalculatorView: View {
    let scitools = [
        "Equipotential Lines Grapher",
        "Electric Field Plotter",
        "3D Potential Graph",
        "Circuit Simulator",
        "Stoichiometry Reaction Calculator",
        "Stoichiometry Mass Calculator",
        "Stellar Properties Solver",
        "Binary Star System Solver",
        "RR Lyrae Variable Calculator"
    ]
    
    @State private var selectedTool: String? = "Equipotential Lines Grapher"
    @State private var columnVisibility = NavigationSplitViewVisibility.automatic
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(scitools, id: \.self, selection: $selectedTool) { tool in
                Text(tool)
            }
            .navigationTitle("SciTools")
        } detail: {
            getToolView(for: selectedTool ?? "")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    func getToolView(for tool: String) -> some View {
        switch tool {
        case "Equipotential Lines Grapher":
            EquipotentialLinesGrapherView()
        case "Electric Field Plotter":
            ElectricFieldPlotterView()
        case "3D Potential Graph":
            PotentialGraph3DView()
        case "Circuit Simulator":
            CircuitSimulatorView()
        case "Stellar Properties Solver":
            LuminosityMagnitudeCalculatorView()
        case "Binary Star System Solver":
            BinaryStarSystemSolverView()
        case "RR Lyrae Variable Calculator":
            RRLyraeVariableCalculatorView()
        default:
            Text("Select a tool from the sidebar")
        }
    }
}

// Placeholder views for each tool
struct EquipotentialLinesGrapherView: View {
    var body: some View {
        Text("Equipotential Lines Grapher")
    }
}

struct ElectricFieldPlotterView: View {
    var body: some View {
        Text("Electric Field Plotter")
    }
}

struct PotentialGraph3DView: View {
    var body: some View {
        Text("3D Potential Graph")
    }
}

struct CircuitSimulatorView: View {
    var body: some View {
        Text("Circuit Simulator")
    }
}

struct StoichiometryReactionCalculatorView: View {
    var body: some View {
        Text("Stoichiometry Reaction Calculator")
    }
}

struct StoichiometryMassCalculatorView: View {
    var body: some View {
        Text("Stoichiometry Mass Calculator")
    }
}
