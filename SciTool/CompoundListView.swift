//
//  CompoundListView.swift
//  SciTool
//
//  Created by Alexander Skula on 7/19/24.
//

import SwiftUI

struct CompoundListView: View {
    var body: some View {
        NavigationView {
            List(compounds) { compound in
                VStack(alignment: .leading) {
                    Text(compound.name)
                        .font(.headline)
                    Text(compound.formula)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Compounds")
        }
    }
}
