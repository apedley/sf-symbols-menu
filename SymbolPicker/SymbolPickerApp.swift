//
//  SymbolPickerApp.swift
//  SymbolPicker
//
//  Created by Andrew Pedley on 12/11/25.
//

import SwiftUI

@main
struct SymbolPickerApp: App {
    var body: some Scene {
        MenuBarExtra(
            "SF Symbol Picker",
            systemImage: "square.grid.2x2"
        ) {
            ContentView()
                .frame(width: 500, height: 500)
        }
        .menuBarExtraStyle(.window)
    }
}
