import Foundation

enum e {
    case _1s, _2s, _2p, _3s, _3p, _3d, _4s, _4p, _4d, _4f, _5s, _5p, _5d, _5f, _6s, _6p, _6d, _7s, _7p
}

enum elementType {
    case hydrogen, nobleGas, nonmetal, metal, transitionMetal, metalloid, lanthanide, actinide, alkaliMetal, alkalineEarthMetal, postTransitionMetal
}

class ElectronShell {
    var shells: [e]
    var numEperShell: [Int]
    
    init(shells: [e], numEperShell: [Int]) {
        self.shells = shells
        self.numEperShell = numEperShell
    }
}

class Element {
    var electronShellComposition: ElectronShell
    var str: String
    var symb: String
    var Z: Int
    var gmol: Double
    var valence: Int
    var type: elementType
    
    init(electronShellComposition: ElectronShell, str: String, symb: String, Z: Int, gmol: Double, valence: Int, type: elementType) {
        self.electronShellComposition = electronShellComposition
        self.str = str
        self.symb = symb
        self.Z = Z
        self.gmol = gmol
        self.valence = valence
        self.type = type
    }
}

class H: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s], numEperShell: [1]),
            str: "Hydrogen",
            symb: "H",
            Z: 1,
            gmol: 1.008,
            valence: 1,
            type: .hydrogen
        )
    }
}

class He: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s], numEperShell: [2]),
            str: "Helium",
            symb: "He",
            Z: 2,
            gmol: 4.0026,
            valence: 0,
            type: .nobleGas
        )
    }
}

class Li: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s], numEperShell: [2, 1]),
            str: "Lithium",
            symb: "Li",
            Z: 3,
            gmol: 6.94,
            valence: 1,
            type: .alkaliMetal
        )
    }
}

class Be: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s], numEperShell: [2, 2]),
            str: "Beryllium",
            symb: "Be",
            Z: 4,
            gmol: 9.0122,
            valence: 2,
            type: .alkalineEarthMetal
        )
    }
}

class B: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p], numEperShell: [2, 2, 1]),
            str: "Boron",
            symb: "B",
            Z: 5,
            gmol: 10.81,
            valence: 3,
            type: .metalloid
        )
    }
}

class C: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p], numEperShell: [2, 2, 2]),
            str: "Carbon",
            symb: "C",
            Z: 6,
            gmol: 12.011,
            valence: 4,
            type: .nonmetal
        )
    }
}

class N: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p], numEperShell: [2, 2, 3]),
            str: "Nitrogen",
            symb: "N",
            Z: 7,
            gmol: 14.007,
            valence: 5,
            type: .nonmetal
        )
    }
}

class O: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p], numEperShell: [2, 2, 4]),
            str: "Oxygen",
            symb: "O",
            Z: 8,
            gmol: 15.999,
            valence: 2,
            type: .nonmetal
        )
    }
}

class F: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p], numEperShell: [2, 2, 5]),
            str: "Fluorine",
            symb: "F",
            Z: 9,
            gmol: 18.998,
            valence: 1,
            type: .nonmetal
        )
    }
}

class Ne: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p], numEperShell: [2, 2, 6]),
            str: "Neon",
            symb: "Ne",
            Z: 10,
            gmol: 20.180,
            valence: 0,
            type: .nobleGas
        )
    }
}

class Na: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s], numEperShell: [2, 2, 6, 1]),
            str: "Sodium",
            symb: "Na",
            Z: 11,
            gmol: 22.990,
            valence: 1,
            type: .alkaliMetal
        )
    }
}

class Mg: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s], numEperShell: [2, 2, 6, 2]),
            str: "Magnesium",
            symb: "Mg",
            Z: 12,
            gmol: 24.305,
            valence: 2,
            type: .alkalineEarthMetal
        )
    }
}

class Al: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p], numEperShell: [2, 2, 6, 2, 1]),
            str: "Aluminum",
            symb: "Al",
            Z: 13,
            gmol: 26.982,
            valence: 3,
            type: .metal
        )
    }
}

class Si: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p], numEperShell: [2, 2, 6, 2, 2]),
            str: "Silicon",
            symb: "Si",
            Z: 14,
            gmol: 28.085,
            valence: 4,
            type: .metalloid
        )
    }
}

class P: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p], numEperShell: [2, 2, 6, 2, 3]),
            str: "Phosphorus",
            symb: "P",
            Z: 15,
            gmol: 30.974,
            valence: 5,
            type: .nonmetal
        )
    }
}

class S: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p], numEperShell: [2, 2, 6, 2, 4]),
            str: "Sulfur",
            symb: "S",
            Z: 16,
            gmol: 32.06,
            valence: 6,
            type: .nonmetal
        )
    }
}

class Cl: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p], numEperShell: [2, 2, 6, 2, 5]),
            str: "Chlorine",
            symb: "Cl",
            Z: 17,
            gmol: 35.45,
            valence: 7,
            type: .nonmetal
        )
    }
}

class Ar: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p], numEperShell: [2, 2, 6, 2, 6]),
            str: "Argon",
            symb: "Ar",
            Z: 18,
            gmol: 39.948,
            valence: 0,
            type: .nobleGas
        )
    }
}

class K: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s], numEperShell: [2, 2, 6, 2, 6, 1]),
            str: "Potassium",
            symb: "K",
            Z: 19,
            gmol: 39.098,
            valence: 1,
            type: .alkaliMetal
        )
    }
}

class Ca: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s], numEperShell: [2, 2, 6, 2, 6, 2]),
            str: "Calcium",
            symb: "Ca",
            Z: 20,
            gmol: 40.078,
            valence: 2,
            type: .alkalineEarthMetal
        )
    }
}

class Sc: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 2, 1]),
            str: "Scandium",
            symb: "Sc",
            Z: 21,
            gmol: 44.956,
            valence: 3,
            type: .transitionMetal
        )
    }
}

class Ti: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 2, 2]),
            str: "Titanium",
            symb: "Ti",
            Z: 22,
            gmol: 47.867,
            valence: 4,
            type: .transitionMetal
        )
    }
}

class V: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 2, 3]),
            str: "Vanadium",
            symb: "V",
            Z: 23,
            gmol: 50.942,
            valence: 5,
            type: .transitionMetal
        )
    }
}

class Cr: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 1, 5]),
            str: "Chromium",
            symb: "Cr",
            Z: 24,
            gmol: 51.996,
            valence: 6,
            type: .transitionMetal
        )
    }
}

class Mn: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 2, 5]),
            str: "Manganese",
            symb: "Mn",
            Z: 25,
            gmol: 54.938,
            valence: 7,
            type: .transitionMetal
        )
    }
}

class Fe: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 2, 6]),
            str: "Iron",
            symb: "Fe",
            Z: 26,
            gmol: 55.845,
            valence: 3,
            type: .transitionMetal
        )
    }
}

class Co: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 2, 7]),
            str: "Cobalt",
            symb: "Co",
            Z: 27,
            gmol: 58.933,
            valence: 2,
            type: .transitionMetal
        )
    }
}

class Ni: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 2, 8]),
            str: "Nickel",
            symb: "Ni",
            Z: 28,
            gmol: 58.693,
            valence: 2,
            type: .transitionMetal
        )
    }
}

class Cu: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 1, 10]),
            str: "Copper",
            symb: "Cu",
            Z: 29,
            gmol: 63.546,
            valence: 2,
            type: .transitionMetal
        )
    }
}

class Zn: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d], numEperShell: [2, 2, 6, 2, 6, 2, 10]),
            str: "Zinc",
            symb: "Zn",
            Z: 30,
            gmol: 65.38,
            valence: 2,
            type: .transitionMetal
        )
    }
}

class Ga: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 1]),
            str: "Gallium",
            symb: "Ga",
            Z: 31,
            gmol: 69.723,
            valence: 3,
            type: .metal
        )
    }
}

class Ge: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 2]),
            str: "Germanium",
            symb: "Ge",
            Z: 32,
            gmol: 72.630,
            valence: 4,
            type: .metalloid
        )
    }
}

class As: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 3]),
            str: "Arsenic",
            symb: "As",
            Z: 33,
            gmol: 74.922,
            valence: 5,
            type: .metalloid
        )
    }
}

class Se: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 4]),
            str: "Selenium",
            symb: "Se",
            Z: 34,
            gmol: 78.971,
            valence: 6,
            type: .nonmetal
        )
    }
}

class Br: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 5]),
            str: "Bromine",
            symb: "Br",
            Z: 35,
            gmol: 79.904,
            valence: 7,
            type: .nonmetal
        )
    }
}

class Kr: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6]),
            str: "Krypton",
            symb: "Kr",
            Z: 36,
            gmol: 83.798,
            valence: 0,
            type: .nobleGas
        )
    }
}

class Rb: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 1]),
            str: "Rubidium",
            symb: "Rb",
            Z: 37,
            gmol: 85.468,
            valence: 1,
            type: .alkaliMetal
        )
    }
}

class Sr: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2]),
            str: "Strontium",
            symb: "Sr",
            Z: 38,
            gmol: 87.62,
            valence: 2,
            type: .alkalineEarthMetal
        )
    }
}

class Y: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 1]),
            str: "Yttrium",
            symb: "Y",
            Z: 39,
            gmol: 88.906,
            valence: 3,
            type: .transitionMetal
        )
    }
}

class Zr: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 2]),
            str: "Zirconium",
            symb: "Zr",
            Z: 40,
            gmol: 91.224,
            valence: 4,
            type: .transitionMetal
        )
    }
}

class Nb: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 1, 4]),
            str: "Niobium",
            symb: "Nb",
            Z: 41,
            gmol: 92.906,
            valence: 5,
            type: .transitionMetal
        )
    }
}

class Mo: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 1, 5]),
            str: "Molybdenum",
            symb: "Mo",
            Z: 42,
            gmol: 95.95,
            valence: 6,
            type: .transitionMetal
        )
    }
}

class Tc: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 5]),
            str: "Technetium",
            symb: "Tc",
            Z: 43,
            gmol: 98.0,
            valence: 7,
            type: .transitionMetal
        )
    }
}

class Ru: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 1, 7]),
            str: "Ruthenium",
            symb: "Ru",
            Z: 44,
            gmol: 101.07,
            valence: 8,
            type: .transitionMetal
        )
    }
}

class Rh: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 1, 8]),
            str: "Rhodium",
            symb: "Rh",
            Z: 45,
            gmol: 102.91,
            valence: 6,
            type: .transitionMetal
        )
    }
}

class Pd: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 10]),
            str: "Palladium",
            symb: "Pd",
            Z: 46,
            gmol: 106.42,
            valence: 4,
            type: .transitionMetal
        )
    }
}

class Ag: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 1, 10]),
            str: "Silver",
            symb: "Ag",
            Z: 47,
            gmol: 107.87,
            valence: 1,
            type: .transitionMetal
        )
    }
}

class Cd: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10]),
            str: "Cadmium",
            symb: "Cd",
            Z: 48,
            gmol: 112.41,
            valence: 2,
            type: .transitionMetal
        )
    }
}

class In: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 1]),
            str: "Indium",
            symb: "In",
            Z: 49,
            gmol: 114.82,
            valence: 3,
            type: .metal
        )
    }
}

class Sn: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 2]),
            str: "Tin",
            symb: "Sn",
            Z: 50,
            gmol: 118.71,
            valence: 4,
            type: .metal
        )
    }
}

class Sb: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 3]),
            str: "Antimony",
            symb: "Sb",
            Z: 51,
            gmol: 121.76,
            valence: 5,
            type: .metalloid
        )
    }
}

class Te: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 4]),
            str: "Tellurium",
            symb: "Te",
            Z: 52,
            gmol: 127.60,
            valence: 6,
            type: .metalloid
        )
    }
}

class I: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 5]),
            str: "Iodine",
            symb: "I",
            Z: 53,
            gmol: 126.90,
            valence: 7,
            type: .nonmetal
        )
    }
}

class Xe: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6]),
            str: "Xenon",
            symb: "Xe",
            Z: 54,
            gmol: 131.29,
            valence: 0,
            type: .nobleGas
        )
    }
}

class Cs: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 1]),
            str: "Cesium",
            symb: "Cs",
            Z: 55,
            gmol: 132.91,
            valence: 1,
            type: .alkaliMetal
        )
    }
}

class Ba: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2]),
            str: "Barium",
            symb: "Ba",
            Z: 56,
            gmol: 137.33,
            valence: 2,
            type: .alkalineEarthMetal
        )
    }
}

class La: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 1]),
            str: "Lanthanum",
            symb: "La",
            Z: 57,
            gmol: 138.91,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Ce: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 1, 1]),
            str: "Cerium",
            symb: "Ce",
            Z: 58,
            gmol: 140.12,
            valence: 4,
            type: .lanthanide
        )
    }
}

class Pr: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 3]),
            str: "Praseodymium",
            symb: "Pr",
            Z: 59,
            gmol: 140.91,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Nd: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 4]),
            str: "Neodymium",
            symb: "Nd",
            Z: 60,
            gmol: 144.24,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Pm: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 5]),
            str: "Promethium",
            symb: "Pm",
            Z: 61,
            gmol: 145,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Sm: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 6]),
            str: "Samarium",
            symb: "Sm",
            Z: 62,
            gmol: 150.36,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Eu: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 7]),
            str: "Europium",
            symb: "Eu",
            Z: 63,
            gmol: 151.96,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Gd: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 7, 1]),
            str: "Gadolinium",
            symb: "Gd",
            Z: 64,
            gmol: 157.25,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Tb: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 9]),
            str: "Terbium",
            symb: "Tb",
            Z: 65,
            gmol: 158.93,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Dy: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 10]),
            str: "Dysprosium",
            symb: "Dy",
            Z: 66,
            gmol: 162.50,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Ho: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 11]),
            str: "Holmium",
            symb: "Ho",
            Z: 67,
            gmol: 164.93,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Er: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 12]),
            str: "Erbium",
            symb: "Er",
            Z: 68,
            gmol: 167.26,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Tm: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 13]),
            str: "Thulium",
            symb: "Tm",
            Z: 69,
            gmol: 168.93,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Yb: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14]),
            str: "Ytterbium",
            symb: "Yb",
            Z: 70,
            gmol: 173.05,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Lu: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 1]),
            str: "Lutetium",
            symb: "Lu",
            Z: 71,
            gmol: 174.97,
            valence: 3,
            type: .lanthanide
        )
    }
}

class Hf: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 2]),
            str: "Hafnium",
            symb: "Hf",
            Z: 72,
            gmol: 178.49,
            valence: 4,
            type: .transitionMetal
        )
    }
}

class Ta: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 3]),
            str: "Tantalum",
            symb: "Ta",
            Z: 73,
            gmol: 180.95,
            valence: 5,
            type: .transitionMetal
        )
    }
}

class W: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 4]),
            str: "Tungsten",
            symb: "W",
            Z: 74,
            gmol: 183.84,
            valence: 6,
            type: .transitionMetal
        )
    }
}

class Re: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 5]),
            str: "Rhenium",
            symb: "Re",
            Z: 75,
            gmol: 186.21,
            valence: 7,
            type: .transitionMetal
        )
    }
}

class Os: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 6]),
            str: "Osmium",
            symb: "Os",
            Z: 76,
            gmol: 190.23,
            valence: 8,
            type: .transitionMetal
        )
    }
}

class Ir: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 7]),
            str: "Iridium",
            symb: "Ir",
            Z: 77,
            gmol: 192.22,
            valence: 6,
            type: .transitionMetal
        )
    }
}

class Pt: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 1, 14, 9]),
            str: "Platinum",
            symb: "Pt",
            Z: 78,
            gmol: 195.08,
            valence: 4,
            type: .transitionMetal
        )
    }
}

class Au: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 1, 14, 10]),
            str: "Gold",
            symb: "Au",
            Z: 79,
            gmol: 196.97,
            valence: 3,
            type: .transitionMetal
        )
    }
}

class Hg: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10]),
            str: "Mercury",
            symb: "Hg",
            Z: 80,
            gmol: 200.59,
            valence: 2,
            type: .transitionMetal
        )
    }
}

class Tl: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 1]),
            str: "Thallium",
            symb: "Tl",
            Z: 81,
            gmol: 204.38,
            valence: 3,
            type: .metal
        )
    }
}

class Pb: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 2]),
            str: "Lead",
            symb: "Pb",
            Z: 82,
            gmol: 207.2,
            valence: 4,
            type: .metal
        )
    }
}

class Bi: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 3]),
            str: "Bismuth",
            symb: "Bi",
            Z: 83,
            gmol: 208.98,
            valence: 5,
            type: .metal
        )
    }
}

class Po: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 4]),
            str: "Polonium",
            symb: "Po",
            Z: 84,
            gmol: 209,
            valence: 6,
            type: .metalloid
        )
    }
}

class At: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 5]),
            str: "Astatine",
            symb: "At",
            Z: 85,
            gmol: 210,
            valence: 7,
            type: .metalloid
        )
    }
}

class Rn: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6]),
            str: "Radon",
            symb: "Rn",
            Z: 86,
            gmol: 222,
            valence: 0,
            type: .nobleGas
        )
    }
}

class Fr: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 1]),
            str: "Francium",
            symb: "Fr",
            Z: 87,
            gmol: 223,
            valence: 1,
            type: .alkaliMetal
        )
    }
}

class Ra: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2]),
            str: "Radium",
            symb: "Ra",
            Z: 88,
            gmol: 226,
            valence: 2,
            type: .alkalineEarthMetal
        )
    }
}

class Ac: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 1]),
            str: "Actinium",
            symb: "Ac",
            Z: 89,
            gmol: 227,
            valence: 3,
            type: .actinide
        )
    }
}

class Th: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 2]),
            str: "Thorium",
            symb: "Th",
            Z: 90,
            gmol: 232.04,
            valence: 4,
            type: .actinide
        )
    }
}

class Pa: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 2, 1]),
            str: "Protactinium",
            symb: "Pa",
            Z: 91,
            gmol: 231.04,
            valence: 5,
            type: .actinide
        )
    }
}

class U: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 3, 1]),
            str: "Uranium",
            symb: "U",
            Z: 92,
            gmol: 238.03,
            valence: 6,
            type: .actinide
        )
    }
}

class Np: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 4, 1]),
            str: "Neptunium",
            symb: "Np",
            Z: 93,
            gmol: 237,
            valence: 6,
            type: .actinide
        )
    }
}

class Pu: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 6]),
            str: "Plutonium",
            symb: "Pu",
            Z: 94,
            gmol: 244,
            valence: 6,
            type: .actinide
        )
    }
}

class Am: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 7]),
            str: "Americium",
            symb: "Am",
            Z: 95,
            gmol: 243,
            valence: 6,
            type: .actinide
        )
    }
}

class Cm: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 7, 1]),
            str: "Curium",
            symb: "Cm",
            Z: 96,
            gmol: 247,
            valence: 6,
            type: .actinide
        )
    }
}

class Bk: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 9]),
            str: "Berkelium",
            symb: "Bk",
            Z: 97,
            gmol: 247,
            valence: 4,
            type: .actinide
        )
    }
}

class Cf: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 10]),
            str: "Californium",
            symb: "Cf",
            Z: 98,
            gmol: 251,
            valence: 4,
            type: .actinide
        )
    }
}

class Es: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 11]),
            str: "Einsteinium",
            symb: "Es",
            Z: 99,
            gmol: 252,
            valence: 3,
            type: .actinide
        )
    }
}

class Fm: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 12]),
            str: "Fermium",
            symb: "Fm",
            Z: 100,
            gmol: 257,
            valence: 3,
            type: .actinide
        )
    }
}

class Md: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 13]),
            str: "Mendelevium",
            symb: "Md",
            Z: 101,
            gmol: 258,
            valence: 3,
            type: .actinide
        )
    }
}

class No: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14]),
            str: "Nobelium",
            symb: "No",
            Z: 102,
            gmol: 259,
            valence: 3,
            type: .actinide
        )
    }
}

class Lr: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._7p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 1]),
            str: "Lawrencium",
            symb: "Lr",
            Z: 103,
            gmol: 266,
            valence: 3,
            type: .actinide
        )
    }
}

// Note: For elements beyond Lawrencium, the electron configurations are theoretical and may be subject to change as new research emerges.

class Rf: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 2]),
            str: "Rutherfordium",
            symb: "Rf",
            Z: 104,
            gmol: 267,
            valence: 4,
            type: .transitionMetal
        )
    }
}

class Db: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 3]),
            str: "Dubnium",
            symb: "Db",
            Z: 105,
            gmol: 268,
            valence: 5,
            type: .transitionMetal
        )
    }
}

class Sg: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 4]),
            str: "Seaborgium",
            symb: "Sg",
            Z: 106,
            gmol: 269,
            valence: 6,
            type: .transitionMetal
        )
    }
}

class Bh: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 5]),
            str: "Bohrium",
            symb: "Bh",
            Z: 107,
            gmol: 270,
            valence: 7,
            type: .transitionMetal
        )
    }
}

class Hs: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 6]),
            str: "Hassium",
            symb: "Hs",
            Z: 108,
            gmol: 269,
            valence: 8,
            type: .transitionMetal
        )
    }
}

class Mt: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 7]),
            str: "Meitnerium",
            symb: "Mt",
            Z: 109,
            gmol: 278,
            valence: 3,
            type: .transitionMetal
        )
    }
}

class Ds: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 8]),
            str: "Darmstadtium",
            symb: "Ds",
            Z: 110,
            gmol: 281,
            valence: 6,
            type: .transitionMetal
        )
    }
}

class Rg: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 9]),
            str: "Roentgenium",
            symb: "Rg",
            Z: 111,
            gmol: 282,
            valence: 3,
            type: .transitionMetal
        )
    }
}

class Cn: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 10]),
            str: "Copernicium",
            symb: "Cn",
            Z: 112,
            gmol: 285,
            valence: 2,
            type: .transitionMetal
        )
    }
}

class Nh: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d, e._7p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 10, 1]),
            str: "Nihonium",
            symb: "Nh",
            Z: 113,
            gmol: 286,
            valence: 3,
            type: .metal
        )
    }
}

class Fl: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d, e._7p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 10, 2]),
            str: "Flerovium",
            symb: "Fl",
            Z: 114,
            gmol: 289,
            valence: 4,
            type: .metal
        )
    }
}

class Mc: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d, e._7p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 10, 3]),
            str: "Moscovium",
            symb: "Mc",
            Z: 115,
            gmol: 290,
            valence: 3,
            type: .metal
        )
    }
}

class Lv: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d, e._7p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 10, 4]),
            str: "Livermorium",
            symb: "Lv",
            Z: 116,
            gmol: 293,
            valence: 2,
            type: .metal
        )
    }
}

class Ts: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d, e._7p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 10, 5]),
            str: "Tennessine",
            symb: "Ts",
            Z: 117,
            gmol: 294,
            valence: 1,
            type: .metalloid
        )
    }
}

class Og: Element {
    init() {
        super.init(
            electronShellComposition: ElectronShell(shells: [e._1s, e._2s, e._2p, e._3s, e._3p, e._4s, e._3d, e._4p, e._5s, e._4d, e._5p, e._6s, e._4f, e._5d, e._6p, e._7s, e._5f, e._6d, e._7p], numEperShell: [2, 2, 6, 2, 6, 2, 10, 6, 2, 10, 6, 2, 14, 10, 6, 2, 14, 10, 6]),
            str: "Oganesson",
            symb: "Og",
            Z: 118,
            gmol: 294,
            valence: 0,
            type: .nobleGas
        )
    }
}
