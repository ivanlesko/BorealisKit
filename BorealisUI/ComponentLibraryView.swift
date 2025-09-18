//
//  ComponentLibraryView.swift
//  BorealisUI
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI
import BorealisKit

struct ComponentLibraryView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                List {
                    Section(header: Text("Data Display")) {
                        NavigationLink("Primary Button") {
                            PrimaryButtonDemoView()
                        }
                        Text("Toggle button")
                    }
                    Section(header: Text("UCM Pattern")) {
                        NavigationLink("Card") {
                            BorealisCardDemoView()
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("BorealisKit")
            }
        }
        .edgesIgnoringSafeArea(.bottom) // ensures the toolbar reaches the bottom of the screen
    }
}

#Preview {
    ComponentLibraryView()
}
