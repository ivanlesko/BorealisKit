//
//  CardDemoView.swift
//  BorealisUI
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI
import BorealisKit

struct BorealisCardDemoView: View {
    @State private var selectedTheme = BorealisTheme.alaska
    @State private var buttonType: PrimaryButton.ButtonType = .primary
    @State private var isFullWidthCTA = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Card preview
            Card(
                imageURL: URL(string: "https://images.contentstack.io/v3/assets/blt2cefe12c88e9dd91/blte809e81b0efe6db8/66d0ad9723cce70a04d5f656/honolulu.webp?width=800&format=webp&crop=4:3&quality=50"),
                title: "Explore Honolulu’s Island Bliss",
                subtitle: "Lets go on a small adventure",
                paragraph: "Immerse yourself in Honolulu’s stunning beaches, rich Hawaiian culture, and breathtaking natural beauty for an unforgettable island adventure. 🌺",
                ctaTitle: "Visit Honolulu",
                ctaAction: { print("CTA tapped") },
                theme: selectedTheme.theme,
                buttonType: buttonType,
                isFullWidthCTA: isFullWidthCTA
            )
            .fixedSize(horizontal: false, vertical: true)
            
            VStack(spacing: 0) {
                // Theme dropdown
                ThemeDropdownView(selectedTheme: $selectedTheme)
                    .fixedSize(horizontal: false, vertical: true)
                
                VStack(spacing: 24) {
                    // Picker for CTA button type
                    Picker("CTA Button Type", selection: $buttonType) {
                        ForEach(PrimaryButton.ButtonType.allCases) { type in
                            Text(type.stringValue).tag(type)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // Toggle for full-width CTA
                    HStack {
                        Text("Full Width CTA")
                        Spacer()
                        Toggle("", isOn: $isFullWidthCTA)
                            .labelsHidden()
                    }
                }
            }
            .padding(.top, 0)
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    BorealisCardDemoView()
}
