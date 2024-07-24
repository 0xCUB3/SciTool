//
//  RRLyrae.swift
//  SciTool
//
//  Created by Alexander Skula on 7/19/24.
//
import SwiftUI

struct RRLyraeVariableCalculatorView: View {
    @State private var period: String = ""
    @State private var brightness: String = ""
    @State private var distance: String = ""
    @State private var periodUnit: Int = 1
    @State private var brightnessUnit: Int = 3
    @State private var distanceUnit: Int = 0
    @State private var calculationMode: CalculationMode = .period
    @State private var result: Double?
    @State private var resultUnit: Int = 0
    @State private var baseResult: Double?

    let periodUnits = ["Years", "Days", "Hours", "Seconds"]
    let brightnessUnits = ["Solar Luminosity", "Watts", "Apparent Magnitude", "Absolute Magnitude"]
    let distanceUnits = ["Parsecs", "Light Years", "Milliarcseconds"]
    
    let L0 = 3.0128e28 // W
    let Lsun = 3.9e26 // W
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("Calculation Mode", selection: $calculationMode) {
                ForEach(CalculationMode.allCases, id: \.self) { mode in
                    Text(mode.rawValue).tag(mode)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            VStack(spacing: 15) {
                if calculationMode != .period {
                    InputView(title: "Period", value: $period, unit: $periodUnit, units: periodUnits)
                }
                if calculationMode != .brightness {
                    InputView(title: "Brightness", value: $brightness, unit: $brightnessUnit, units: brightnessUnits)
                }
                if calculationMode != .distance {
                    InputView(title: "Distance", value: $distance, unit: $distanceUnit, units: distanceUnits)
                }
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
            .buttonStyle(PlainButtonStyle()) // This removes the default button styling
            .padding(.horizontal)

            if let result = result {
                HStack {
                    Text("\(calculationMode.rawValue): \(String(format: "%.6f", result))")
                    Spacer()
                    Picker("Unit", selection: $resultUnit) {
                        ForEach(0..<unitsForCurrentMode().count, id: \.self) { index in
                            Text(unitsForCurrentMode()[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: resultUnit) { _ in
                        convertResult()
                    }
                }
                .padding()
                .background(Color(.windowBackgroundColor))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            }

            Spacer()
        }
        .padding()
        .background(Color(.textBackgroundColor))
        .navigationTitle("RR Lyrae Calculator")
    }

    func unitsForCurrentMode() -> [String] {
        switch calculationMode {
        case .period:
            return periodUnits
        case .brightness:
            return brightnessUnits
        case .distance:
            return distanceUnits
        }
    }

    func calculate() {
        switch calculationMode {
        case .period:
            calculatePeriod()
        case .brightness:
            calculateBrightness()
        case .distance:
            calculateDistance()
        }
    }
    
    func convertResult() {
        guard let baseResult = baseResult else { return }
        
        switch calculationMode {
        case .period:
            result = convertFromDays(baseResult, unit: resultUnit)
        case .brightness:
            result = convertFromWatts(baseResult, unit: resultUnit)
        case .distance:
            result = convertFromParsecs(baseResult, unit: resultUnit)
        }
    }
    
    func convertPeriod(_ value: Double, from: Int, to: Int) -> Double {
        let inDays = convertToDays(value, unit: from)
        return convertFromDays(inDays, unit: to)
    }
    
    func convertToDays(_ value: Double, unit: Int) -> Double {
        switch unit {
        case 0: return value * 365 // Years to days
        case 1: return value // Already in days
        case 2: return value / 24 // Hours to days
        case 3: return value / (24 * 3600) // Seconds to days
        default: return value
        }
    }
    
    func convertFromDays(_ value: Double, unit: Int) -> Double {
        switch unit {
        case 0: return value / 365 // Days to years
        case 1: return value // Keep in days
        case 2: return value * 24 // Days to hours
        case 3: return value * 24 * 3600 // Days to seconds
        default: return value
        }
    }
    
    func convertBrightness(_ value: Double, from: Int, to: Int) -> Double {
        let inWatts = convertToWatts(value, unit: from)
        return convertFromWatts(inWatts, unit: to)
    }
    
    func convertToWatts(_ value: Double, unit: Int) -> Double {
        switch unit {
        case 0: return value * Lsun // Solar Luminosity to Watts
        case 1: return value // Already in Watts
        case 2, 3: // Apparent or Absolute Magnitude to Watts
            return L0 * pow(10, -0.4 * (value - 4.74))
        default: return value
        }
    }
    
    func convertFromWatts(_ value: Double, unit: Int) -> Double {
        switch unit {
        case 0: return value / Lsun // Watts to Solar Luminosity
        case 1: return value // Keep in Watts
        case 2, 3: // Watts to Apparent or Absolute Magnitude
            return -2.5 * log10(value / L0) + 4.74
        default: return value
        }
    }
    
    func convertDistance(_ value: Double, from: Int, to: Int) -> Double {
        let inParsecs = convertToParsecs(value, unit: from)
        return convertFromParsecs(inParsecs, unit: to)
    }
    
    func convertToParsecs(_ value: Double, unit: Int) -> Double {
        switch unit {
        case 0: return value // Already in Parsecs
        case 1: return value / 3.261563 // Light Years to Parsecs
        case 2: return 1000 / value // Milliarcseconds to Parsecs
        default: return value
        }
    }
    
    func convertFromParsecs(_ value: Double, unit: Int) -> Double {
        switch unit {
        case 0: return value // Keep in Parsecs
        case 1: return value * 3.261563 // Parsecs to Light Years
        case 2: return 1000 / value // Parsecs to Milliarcseconds
        default: return value
        }
    }
    
    func calculatePeriod() {
        guard let brightnessValue = Double(brightness), let distanceValue = Double(distance) else { return }
        
        let distanceParsecs = convertToParsecs(distanceValue, unit: distanceUnit)
        let brightnessWatts = convertToWatts(brightnessValue, unit: brightnessUnit)
        
        let absmag = -2.5 * log10(brightnessWatts / L0) + 4.74
        
        baseResult = pow(10, (absmag + 1.43) / (-2.81))  // Store in days
        resultUnit = periodUnit
        result = convertFromDays(baseResult!, unit: resultUnit)
    }

    func calculateBrightness() {
        guard let periodValue = Double(period), let distanceValue = Double(distance) else { return }
        
        let periodDays = convertToDays(periodValue, unit: periodUnit)
        let distanceParsecs = convertToParsecs(distanceValue, unit: distanceUnit)
        
        let absmag = -2.81 * log10(periodDays) - 1.43
        baseResult = L0 * pow(10, -0.4 * (absmag - 4.74))  // Store in Watts
        resultUnit = brightnessUnit
        result = convertFromWatts(baseResult!, unit: resultUnit)
    }

    func calculateDistance() {
        guard let periodValue = Double(period), let brightnessValue = Double(brightness) else { return }
        
        let periodDays = convertToDays(periodValue, unit: periodUnit)
        let brightnessWatts = convertToWatts(brightnessValue, unit: brightnessUnit)
        
        let absmag = -2.81 * log10(periodDays) - 1.43
        let appmag = -2.5 * log10(brightnessWatts / L0) + 4.74
        
        baseResult = pow(10, (appmag - absmag + 5) / 5)  // Store in parsecs
        resultUnit = distanceUnit
        result = convertFromParsecs(baseResult!, unit: resultUnit)
    }
}
enum CalculationMode: String, CaseIterable {
    case period = "Period"
    case brightness = "Brightness"
    case distance = "Distance"
}
