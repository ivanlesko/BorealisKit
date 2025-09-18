//
//  FeatureBannerDemoView.swift
//  BorealisUI
//
//  Created by IvanL on 9/18/25.
//

import SwiftUI
import BorealisKit

struct FeatureBannerDemo: View {
    @State private var selectedTheme = BorealisTheme.alaska
    @State private var buttonType: PrimaryButton.ButtonType = .primary
    @State private var headline: String = "Let's go somewhere"
    @State private var description: String = "Towering mountains, pristine glaciers, and vibrant wildlife await you on your next adventure."
    @State private var backgroundImageURL: String = "https://images.contentstack.io/v3/assets/blt2cefe12c88e9dd91/bltbba189b06cde7af2/deli_global_escape.jpg"
    @State private var overlayOpacity: Double = 0.7
    @State private var imageURL: String = "https://images.contentstack.io/v3/assets/blt2cefe12c88e9dd91/blt5e924e15e3e50d61/668d452562008a71b810f8bb/hero_global_escape.jpg?width=268&quality=50"
    @State private var imageShape: FeatureBanner.ImageShape = .circle
    @State private var ctaTitle: String = "Plan Your Trip"
    
    var body: some View {
        VStack(spacing: 16) {
            FeatureBanner(
                headline: headline,
                description: description,
                theme: selectedTheme.theme,
                backgroundImageURL: backgroundImageURL,
                backgroundOverlay: Color.white.opacity(overlayOpacity),
                imageShape: imageShape,
                imageURL: imageURL,
                ctaType: buttonType,
                ctaTitle: ctaTitle,
                ctaAction: { print("CTA tapped") }
            )
            .frame(height: 200)
            .padding()
            
            VStack {
                
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
                    }
                }
                .padding(.top, 0)
                
                Slider(value: $overlayOpacity, in: 0...1, step: 0.01) {
                    Text("Overlay Opacity")
                }
                Picker("Image Shape", selection: $imageShape) {
                    Text("Circle").tag(FeatureBanner.ImageShape.circle)
                    Text("Square").tag(FeatureBanner.ImageShape.square)
                }
                .pickerStyle(.segmented)
            }
            .padding()
        }
        .padding(.top, 24)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    FeatureBannerDemo()
}

