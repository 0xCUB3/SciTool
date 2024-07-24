//
//  BinaryStar.swift
//  SciTool
//
//  Created by Alexander Skula on 7/24/24.
//

import SwiftUI

struct BinaryStarSystemSolverView: View {
    @State private var period: String = ""
    @State private var separation: String = ""
    @State private var periodUnit: Int = 0
    @State private var separationUnit: Int = 0
    @State private var result: String = ""

    let periodUnits = ["Years", "Days", "Seconds"]
    let separationUnits = ["AU", "Parsecs", "Milliarcseconds"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Binary Star System Calculator")
                .font(.title)
                .padding()

            VStack(spacing: 15) {
                InputView(title: "Orbital Period", value: $period, unit: $periodUnit, units: periodUnits)
                InputView(title: "Separation", value: $separation, unit: $separationUnit, units: separationUnits)
            }
            .padding()
            .background(Color(.windowBackgroundColor))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

            Button(action: calculate) {
                Text("Calculate")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.horizontal)

            if !result.isEmpty {
                Text(result)
                    .padding()
                    .background(Color(.windowBackgroundColor))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            }

            Spacer()
        }
        .padding()
        .background(Color(.textBackgroundColor))
    }

    func calculate() {
        guard let periodValue = Double(period), let separationValue = Double(separation) else {
            result = "Please enter valid numbers for period and separation."
            return
        }

        let orbitalPeriodYears = convertToYears(periodValue, unit: periodUnit)
        let separationAU = convertToAU(separationValue, unit: separationUnit)

        let mTot = separationAU * separationAU * separationAU / (orbitalPeriodYears * orbitalPeriodYears)
        let mTotKg = mTot * 1.9891e30

        result = String(format: "Total mass is %.4f solar masses = %.4e kg", mTot, mTotKg)
    }

    func convertToYears(_ value: Double, unit: Int) -> Double {
        switch unit {
        case 0: return value // Already in years
        case 1: return value / 365 // Days to years
        case 2: return value / (365 * 24 * 3600) // Seconds to years
        default: return value
        }
    }

    func convertToAU(_ value: Double, unit: Int) -> Double {
        switch unit {
        case 0: return value // Already in AU
        case 1: return value * 206264.8 // Parsecs to AU
        case 2: return 1 / (value / 1000) * 206264.8 // Milliarcseconds to AU
        default: return value
        }
    }
}
