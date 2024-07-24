//
//  LumMag.swift
//  SciTool
//
//  Created by Alexander Skula on 7/24/24.
//

import SwiftUI

struct LuminosityMagnitudeCalculatorView: View {
    @State private var knownQuantity: String = ""
    @State private var whatToSolveFor: Int = 0
    @State private var distance: String = ""
    @State private var distanceUnit: Int = 0
    @State private var isMainSequence: Bool = false
    @State private var result: String = ""

    let solveForOptions = ["Luminosity (L_sun)", "Luminosity (W)", "Magnitude", "Absolute Magnitude"]
    let distanceUnits = ["Parsecs", "Light Years", "Milliarcseconds"]

    let L0 = 3.0128e28 // W
    let Lsun = 3.9e26 // W
    let Msun = 1.989E30 // kg

    var body: some View {
        VStack(spacing: 20) {
            Text("Luminosity and Magnitude Calculator")
                .font(.title)
                .padding()

            VStack(spacing: 15) {
                Picker("Solve for", selection: $whatToSolveFor) {
                    ForEach(0..<solveForOptions.count, id: \.self) { index in
                        Text(solveForOptions[index]).tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())

                HStack {
                    Text("Known Quantity")
                        .frame(width: 120, alignment: .leading)
                    TextField("Value", text: $knownQuantity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                HStack {
                    Text("Distance")
                        .frame(width: 120, alignment: .leading)
                    TextField("Value", text: $distance)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Picker("", selection: $distanceUnit) {
                        ForEach(0..<distanceUnits.count, id: \.self) { index in
                            Text(distanceUnits[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Toggle("Is Main Sequence", isOn: $isMainSequence)
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
        guard let input = Double(knownQuantity), let distValue = Double(distance) else {
            result = "Please enter valid numbers for known quantity and distance."
            return
        }

        let dist = convertDistance(distValue)

        switch whatToSolveFor {
        case 0, 1:
            calculateLuminosity(input: input, dist: dist)
        case 2:
            calculateMagnitude(input: input, dist: dist)
        case 3:
            calculateLuminosityFromAbsMag(input: input, dist: dist)
        default:
            result = "Invalid selection"
        }
    }

    func convertDistance(_ value: Double) -> Double {
        switch distanceUnit {
        case 0: return value // Already in parsecs
        case 1: return value / 3.261563 // Light years to parsecs
        case 2: return 1 / (value / 1000) // Milliarcseconds to parsecs
        default: return value
        }
    }

    func calculateLuminosity(input: Double, dist: Double) {
        let lumWatts = whatToSolveFor == 0 ? input * Lsun : input
        let Mbol = -2.5 * log10(lumWatts) + 71.1974
        let M_app = Mbol - 5 + 5 * log10(dist)
        
        let lumFactor = lumWatts / Lsun
        var extraInfo = ""
        
        if isMainSequence {
            let mass = pow(lumFactor, 1/3.5)
            let massKg = mass * Msun
            extraInfo = String(format: ". Mass %.4f Msun = %.4e kg", mass, massKg)
        }
        
        result = String(format: "Luminosity: %.4e W or %.4f L_sun. Distance: %.2f pc, %.2f ly, parallax: %.4f mas. Abs Magnitude: %.2f, App Magnitude: %.2f%@", lumWatts, lumFactor, dist, dist * 3.261563, 1000 / dist, Mbol, M_app, extraInfo)
    }

    func calculateMagnitude(input: Double, dist: Double) {
        let lumWatts = input * Lsun
        let Mbol = -2.5 * log10(lumWatts) + 71.1974
        let M_app = Mbol - 5 + 5 * log10(dist)
        
        var extraInfo = ""
        if isMainSequence {
            let mass = pow(input, 1/3.5)
            let massKg = mass * Msun
            extraInfo = String(format: ". Mass %.4f Msun = %.4e kg", mass, massKg)
        }
        
        result = String(format: "Absolute magnitude: %.2f; Apparent magnitude: %.2f. Distance: %.2f pc, %.2f ly, parallax: %.4f mas%@", Mbol, M_app, dist, dist * 3.261563, 1000 / dist, extraInfo)
    }

    func calculateLuminosityFromAbsMag(input: Double, dist: Double) {
        let exp = -0.4 * input
        let lum = L0 * pow(10, exp)
        let lumFactor = lum / Lsun
        
        var extraInfo = ""
        if isMainSequence {
            let mass = pow(lumFactor, 1/3.5)
            let massKg = mass * Msun
            extraInfo = String(format: ". Mass %.4f Msun = %.4e kg", mass, massKg)
        }
        
        result = String(format: "Luminosity: %.4e W or %.4f L_sun. Distance: %.2f pc, %.2f ly, parallax: %.4f mas. Abs Magnitude: %.2f, App Magnitude: %.2f%@", lum, lumFactor, dist, dist * 3.261563, 1000 / dist, input, input - 5 + 5 * log10(dist), extraInfo)
    }
}
