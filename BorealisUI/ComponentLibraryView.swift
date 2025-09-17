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
                        Text("Primary button")
                        Text("Toggle button")
                    }
                    Section(header: Text("UCM Pattern")) {
                        Text("Card")
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("BorealisKit")
            }
            
            // Fixed bottom toolbar
            HStack {
                Spacer()
                ThemeDropdownView()
                Spacer()
            }
            .frame(height: 75)
            .background(Color(uiColor: .systemGroupedBackground))
        }
        .edgesIgnoringSafeArea(.bottom) // ensures the toolbar reaches the bottom of the screen
    }
}

#Preview {
    ComponentLibraryView()
}
