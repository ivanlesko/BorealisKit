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
                    }
                    Section(header: Text("UCM Pattern")) {
                        NavigationLink("Card") {
                            BorealisCardDemoView()
                        }
                        
                        NavigationLink("Feature banner") {
                            FeatureBannerDemo()
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("BorealisKit")
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ComponentLibraryView()
}
