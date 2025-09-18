//
//  Card.swift
//  BorealisKit
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI

public struct Card: View {
    public let imageURL: URL?
    public let title: String
    public let subtitle: String?
    public let paragraph: String?
    public let ctaTitle: String?
    public let ctaAction: (() -> Void)?
    public let theme: Theme
    public let buttonType: PrimaryButton.ButtonType
    public let isFullWidthCTA: Bool
    
    public init(
        imageURL: URL? = nil,
        title: String,
        subtitle: String? = nil,
        paragraph: String? = nil,
        ctaTitle: String? = nil,
        ctaAction: (() -> Void)? = nil,
        theme: Theme,
        buttonType: PrimaryButton.ButtonType = .primary,
        isFullWidthCTA: Bool = true
    ) {
        self.imageURL = imageURL
        self.title = title
        self.subtitle = subtitle
        self.paragraph = paragraph
        self.ctaTitle = ctaTitle
        self.ctaAction = ctaAction
        self.theme = theme
        self.buttonType = buttonType
        self.isFullWidthCTA = isFullWidthCTA
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image
            if let imageURL = imageURL {
                AsyncImage(url: imageURL) { phase in
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
                .frame(height: 220)
                .clipped()
                .cornerRadius(12, corners: [.topLeft, .topRight])
            }
            
            // Content area
            VStack(alignment: .leading, spacing: 16) {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                if let paragraph = paragraph {
                    Text(paragraph)
                        .font(.caption)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                if let ctaTitle, let ctaAction = ctaAction {
                    PrimaryButton(
                        title: ctaTitle,
                        theme: theme,
                        buttonType: buttonType,
                        isFullWidth: isFullWidthCTA,
                        action: ctaAction
                    )
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(UIColor.systemBackground))
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 4)
    }
}

// Helper for rounding specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 12
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Preview
struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(
            imageURL: URL(string: "https://images.contentstack.io/v3/assets/blt2cefe12c88e9dd91/blte809e81b0efe6db8/66d0ad9723cce70a04d5f656/honolulu.webp?width=800&format=webp&crop=4:3&quality=50"),
            title: "Honolulu Getaway",
            subtitle: "Sunny beaches and perfect waves",
            paragraph: "Experience the best of Honolulu with our exclusive travel packages. Relax on pristine beaches and explore local culture in style.",
            ctaTitle: "Book Now",
            ctaAction: { print("CTA tapped!") },
            theme: BorealisTheme.alaska.theme,
            buttonType: .primary,
            isFullWidthCTA: false
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

