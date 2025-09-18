//
//  FeatureBanner.swift
//  BorealisKit
//
//  Created by IvanL on 9/18/25.
//

import SwiftUI

public struct FeatureBanner: View {
    
    public enum ImageShape {
        case circle
        case square
    }
    
    public let headline: String
    public let description: String
    public let theme: Theme
    public let backgroundImageURL: String?
    public let backgroundOverlay: Color
    public let imageShape: ImageShape
    public let imageURL: String?
    public let ctaType: PrimaryButton.ButtonType
    public let ctaTitle: String?
    public let ctaAction: (() -> Void)?
    
    public init(
        headline: String = "",
        description: String = "",
        theme: Theme = BorealisTheme.alaska.theme,
        backgroundImageURL: String? = nil,
        backgroundOverlay: Color = Color.white.opacity(0.5),
        imageShape: ImageShape = .circle,
        imageURL: String? = nil,
        ctaType: PrimaryButton.ButtonType = .primary,
        ctaTitle: String? = nil,
        ctaAction: (() -> Void)? = nil
    ) {
        self.headline = headline
        self.description = description
        self.theme = theme
        self.backgroundImageURL = backgroundImageURL
        self.backgroundOverlay = backgroundOverlay
        self.imageShape = imageShape
        self.imageURL = imageURL
        self.ctaType = ctaType
        self.ctaTitle = ctaTitle
        self.ctaAction = ctaAction
    }
    
    public var body: some View {
        ZStack {
            // Background
            if let backgroundImageURL,
               let url = URL(string: backgroundImageURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Color.gray.opacity(0.2)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .overlay(backgroundOverlay)
                            .clipped()
                    case .failure:
                        Color.gray.opacity(0.2)
                    @unknown default:
                        Color.gray.opacity(0.2)
                    }
                }
                .frame(maxWidth: .infinity)
            } else {
                backgroundOverlay
                    .frame(maxWidth: .infinity)
            }
            
            // Foreground content
            HStack(alignment: .top, spacing: 16) {
                // Left image
                if let imageURL, let url = URL(string: imageURL) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            Color.gray.opacity(0.2)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        case .failure:
                            Color.red.opacity(0.2)
                        @unknown default:
                            Color.gray.opacity(0.2)
                        }
                    }
                    .frame(width: 80, height: 80)
                    .cornerRadius(imageShape == .circle ? 100 : 0)
                }
                
                // Right text + button
                VStack(alignment: .leading, spacing: 8) {
                    if !headline.isEmpty {
                        Text(headline)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(theme.primaryColor)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    if !description.isEmpty {
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    if let ctaTitle, let ctaAction {
                        PrimaryButton(
                            title: ctaTitle,
                            theme: theme,
                            buttonType: ctaType,
                            isFullWidth: false,
                            action: ctaAction
                        )
                        .padding(.top, 8)
                    }
                }
                Spacer(minLength: 0)
            }
            .padding()
        }
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 4)
    }
}

#Preview {
    FeatureBanner(
        headline: "Let's go somewhere",
        description: "Towering mountains, pristine glaciers, and vibrant wildlife await you on your next adventure.",
        theme: BorealisTheme.hawaaiian.theme,
        backgroundImageURL: "https://images.contentstack.io/v3/assets/blt2cefe12c88e9dd91/bltbba189b06cde7af2/deli_global_escape.jpg",
        backgroundOverlay: Color.white.opacity(0.7),
        imageShape: .circle,
        imageURL: "https://images.contentstack.io/v3/assets/blt2cefe12c88e9dd91/blt5e924e15e3e50d61/668d452562008a71b810f8bb/hero_global_escape.jpg?width=268&quality=50",
        ctaType: .primary,
        ctaTitle: "Plan Your Trip",
        ctaAction: { print("CTA tapped") }
    )
    .frame(height: 200)
    .padding()
}
