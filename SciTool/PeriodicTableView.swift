//
//  PeriodicTableView.swift
//  SciTool
//
//  Created by Alexander Skula on 7/19/24.
//

import SwiftUI

struct PeriodicTableView: View {
    @State private var searchText = ""
    
    // You'll need to create this array of all elements
    static let allElements: [Element] = [
        H(), He(), Li(), Be(), B(), C(), N(), O(), F(), Ne(),
        Na(), Mg(), Al(), Si(), P(), S(), Cl(), Ar(),
        K(), Ca(), Sc(), Ti(), V(), Cr(), Mn(), Fe(), Co(), Ni(), Cu(), Zn(),
        Ga(), Ge(), As(), Se(), Br(), Kr(),
        Rb(), Sr(), Y(), Zr(), Nb(), Mo(), Tc(), Ru(), Rh(), Pd(), Ag(), Cd(),
        In(), Sn(), Sb(), Te(), I(), Xe(),
        Cs(), Ba(),
        La(), Ce(), Pr(), Nd(), Pm(), Sm(), Eu(), Gd(), Tb(), Dy(), Ho(), Er(), Tm(), Yb(), Lu(),
        Hf(), Ta(), W(), Re(), Os(), Ir(), Pt(), Au(), Hg(),
        Tl(), Pb(), Bi(), Po(), At(), Rn(),
        Fr(), Ra(),
        Ac(), Th(), Pa(), U(), Np(), Pu(), Am(), Cm(), Bk(), Cf(), Es(), Fm(), Md(), No(), Lr(),
        Rf(), Db(), Sg(), Bh(), Hs(), Mt(), Ds(), Rg(), Cn(), Nh(), Fl(), Mc(), Lv(), Ts(), Og()
    ]
    
    var filteredElements: [Element] {
        if searchText.isEmpty {
            return PeriodicTableView.allElements
        } else {
            return PeriodicTableView.allElements.filter { element in
                element.str.lowercased().contains(searchText.lowercased()) ||
                element.symb.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBar(text: $searchText)
                .padding(.horizontal)
                .padding(.top)
            
            GeometryReader { geometry in
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    PeriodicTableGrid(elements: filteredElements, size: geometry.size)
                        .padding()
                }
            }
        }
    }
}

struct PeriodicTableGrid: View {
    let elements: [Element]
    let size: CGSize
    
    var body: some View {
        let cellSize = min(size.width / 18, size.height / 10) * 0.9
        let spacing: CGFloat = cellSize * 0.05
        
        VStack(spacing: spacing) {
            // Period 1
            HStack(spacing: spacing) {
                ElementCell(element: elementFor(1), size: cellSize)
                Color.clear.frame(width: cellSize * 16 + spacing * 15, height: cellSize)
                ElementCell(element: elementFor(2), size: cellSize)
            }
            
            // Period 2
            HStack(spacing: spacing) {
                ForEach(3...4, id: \.self) { i in
                    ElementCell(element: elementFor(i), size: cellSize)
                }
                Color.clear.frame(width: cellSize * 10 + spacing * 9, height: cellSize)
                ForEach(5...10, id: \.self) { i in
                    ElementCell(element: elementFor(i), size: cellSize)
                }
            }
            
            // Period 3
            HStack(spacing: spacing) {
                ForEach(11...18, id: \.self) { i in
                    ElementCell(element: elementFor(i), size: cellSize)
                }
            }
            
            // Period 4
            HStack(spacing: spacing) {
                ForEach(19...36, id: \.self) { i in
                    ElementCell(element: elementFor(i), size: cellSize)
                }
            }
            
            // Periods 5-6
            ForEach(5...6, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(1...18, id: \.self) { column in
                        ElementCell(element: elementFor((row - 1) * 18 + column), size: cellSize)
                    }
                }
            }
            
            // Period 7 (with lanthanides and actinides placeholders)
            HStack(spacing: spacing) {
                ElementCell(element: elementFor(87), size: cellSize)
                ElementCell(element: elementFor(88), size: cellSize)
                ElementCell(element: nil, size: cellSize, text: "57-71")
                ForEach(104...118, id: \.self) { i in
                    ElementCell(element: elementFor(i), size: cellSize)
                }
                ElementCell(element: nil, size: cellSize, text: "89-103")
            }
            
            Color.clear.frame(height: spacing * 2)
            
            // Lanthanides
            HStack(spacing: spacing) {
                Text("57-71").font(.caption).frame(width: cellSize * 2 + spacing, alignment: .trailing)
                ForEach(57...71, id: \.self) { number in
                    ElementCell(element: elementFor(number), size: cellSize)
                }
            }
            
            // Actinides
            HStack(spacing: spacing) {
                Text("89-103").font(.caption).frame(width: cellSize * 2 + spacing, alignment: .trailing)
                ForEach(89...103, id: \.self) { number in
                    ElementCell(element: elementFor(number), size: cellSize)
                }
            }
        }
    }
    
    func elementFor(_ atomicNumber: Int) -> Element? {
        elements.first { $0.Z == atomicNumber }
    }
}

struct ElementCell: View {
    let element: Element?
    let size: CGFloat
    let text: String?
    @State private var showingPopover = false
    
    init(element: Element?, size: CGFloat, text: String? = nil) {
        self.element = element
        self.size = size
        self.text = text
    }
    
    var body: some View {
        Group {
            if let element = element {
                Button(action: {
                    showingPopover = true
                }) {
                    elementContent(element)
                }
                .buttonStyle(PlainButtonStyle())
                .popover(isPresented: $showingPopover) {
                    ElementDetailView(element: element)
                        .frame(width: 300, height: 400)
                }
            } else if let text = text {
                elementContent(text: text)
            } else {
                Color.clear
                    .frame(width: size, height: size)
            }
        }
    }
    
    @ViewBuilder
    private func elementContent(_ element: Element) -> some View {
        VStack(spacing: 2) {
            Text(element.symb)
                .font(.system(size: size * 0.25, weight: .bold))
            Text(String(element.Z))
                .font(.system(size: size * 0.18))
            Text(element.str)
                .font(.system(size: size * 0.14))
                .lineLimit(1)
                .truncationMode(.tail)
        }
        .foregroundColor(.white)
        .frame(width: size, height: size)
        .background(colorForType(element.type))
        .cornerRadius(size * 0.07)
        .shadow(color: .gray.opacity(0.3), radius: 2, x: 1, y: 1)
    }
    
    private func elementContent(text: String) -> some View {
        Text(text)
            .font(.system(size: size * 0.2, weight: .bold))
            .foregroundColor(.white)
            .frame(width: size, height: size)
            .background(Color.gray)
            .cornerRadius(size * 0.07)
            .shadow(color: .gray.opacity(0.3), radius: 2, x: 1, y: 1)
    }
    
    func colorForType(_ type: elementType) -> Color {
        switch type {
        case .hydrogen:
            return Color(red: 0.2, green: 0.8, blue: 0.2)
        case .alkaliMetal:
            return Color(red: 0.9, green: 0.2, blue: 0.2)
        case .alkalineEarthMetal:
            return Color(red: 1.0, green: 0.5, blue: 0.0)
        case .transitionMetal:
            return Color(red: 0.8, green: 0.8, blue: 0.2)
        case .lanthanide:
            return Color(red: 0.2, green: 0.4, blue: 0.8)
        case .actinide:
            return Color(red: 0.6, green: 0.2, blue: 0.6)
        case .postTransitionMetal:
            return Color(red: 0.8, green: 0.4, blue: 0.6)
        case .metalloid:
            return Color(red: 0.4, green: 0.8, blue: 0.6)
        case .nonmetal:
            return Color(red: 0.2, green: 0.8, blue: 0.2)
        case .nobleGas:
            return Color(red: 0.2, green: 0.8, blue: 0.8)
        case .metal:
            return Color(red: 0.6, green: 0.6, blue: 0.6)
        }
    }
}

struct ElementDetailView: View {
    let element: Element
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(element.str)
                .font(.title)
            Text(element.symb)
                .font(.headline)
            Text("Atomic Number: \(element.Z)")
            Text("Mass: \(element.gmol, specifier: "%.4f")")
            Text("Type: \(typeName(element.type))")
            Text("Valence: \(element.valence)")
            Text("Electron Configuration:")
            Text(electronConfigurationString(element.electronShellComposition))
                .font(.system(size: 12))
        }
        .padding()
    }
    
    func typeName(_ type: elementType) -> String {
        switch type {
        case .hydrogen: return "Hydrogen"
        case .alkaliMetal: return "Alkali Metal"
        case .alkalineEarthMetal: return "Alkaline Earth Metal"
        case .transitionMetal: return "Transition Metal"
        case .lanthanide: return "Lanthanide"
        case .actinide: return "Actinide"
        case .postTransitionMetal: return "Post-Transition Metal"
        case .metalloid: return "Metalloid"
        case .nonmetal: return "Nonmetal"
        case .nobleGas: return "Noble Gas"
        case .metal: return "Metal"
        }
    }
    
    func electronConfigurationString(_ config: ElectronShell) -> String {
        zip(config.shells, config.numEperShell)
            .map { shell, count in "\(shell): \(count)" }
            .joined(separator: ", ")
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search elements", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
    }
}
