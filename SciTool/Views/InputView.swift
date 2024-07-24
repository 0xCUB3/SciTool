//
//  InputView.swift
//  SciTool
//
//  Created by Alexander Skula on 7/24/24.
//

import SwiftUI

struct InputView: View {
    let title: String
    @Binding var value: String
    @Binding var unit: Int
    let units: [String]

    var body: some View {
        HStack {
            Text(title)
                .frame(width: 100, alignment: .leading)
            TextField("Value", text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Picker("", selection: $unit) {
                ForEach(0..<units.count, id: \.self) { index in
                    Text(units[index]).tag(index)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}
