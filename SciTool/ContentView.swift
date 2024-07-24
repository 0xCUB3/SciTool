//
//  ContentView.swift
//  SciTool
//
//  Created by Alexander Skula on 7/19/24.
//

import SwiftUI
import SwiftData
import AppKit

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            PeriodicTableView()
                .tabItem {
                    Label("Periodic Table", systemImage: "tablecells")
                }
                .tag(0)
            
            CompoundListView()
                .tabItem {
                    Label("Compounds", systemImage: "doc.text")
                }
                .tag(1)
            
            CalculatorView()
                .tabItem {
                    Label("Calculators", systemImage: "function")
                }
                .tag(2)
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            updateWindowSize(for: newValue)
        }
    }
    
    private func updateWindowSize(for tab: Int) {
        let newSize: NSSize
        switch tab {
        case 0, 1:
            newSize = NSSize(width: 1000, height: 700)
        case 2:
            newSize = NSSize(width: 640, height: 480)
        default:
            return
        }
        
        if let window = NSApplication.shared.windows.first {
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = 0.3
                context.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                window.animator().setFrame(NSRect(origin: window.frame.origin, size: newSize), display: true)
            }, completionHandler: nil)
        }
    }
}
