//
//  PrimaryButton.swift
//  BorealisKit
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI

public struct PrimaryButton: View {
    
    public enum ButtonType: CaseIterable, Identifiable {
        case primary
        case secondary
        case nav
        
        public var id: String { stringValue }
        
        public var stringValue: String {
            switch self {
            case .primary:
                "Primary"
            case .secondary:
                "Secondary"
            case .nav:
                "Nav"
            }
        }
        
    }
    
    // Public properties
    public let title: String
    public let action: (() -> Void)?
    public let theme: Theme
    public let buttonType: ButtonType
    public let isFullWidth: Bool
    
    // Public initializer
    public init(title: String,
                theme: Theme,
                buttonType: ButtonType = .primary,
                isFullWidth: Bool = true,
                action: (() -> Void)? = nil) {
        self.title = title
        self.theme = theme
        self.buttonType = buttonType
        self.isFullWidth = buttonType == .nav ? false : isFullWidth
        self.action = action
    }
    
    public var body: some View {
        Button(action: { action?() }) {
            content
        }
        .frame(maxWidth: isFullWidth ? .infinity : nil, alignment: .leading)
    }
    
    @ViewBuilder
    private var content: some View {
        switch buttonType {
        case .primary, .secondary:
            Text(title)
                .font(.headline)
                .padding(theme.buttonPadding)
                .frame(maxWidth: isFullWidth ? .infinity : nil)
                .background(backgroundView)
                .foregroundColor(foregroundColor)
                .cornerRadius(theme.buttonCornerRadius)
                .overlay(borderView)
        case .nav:
            HStack {
                Text(title)
                    .foregroundColor(theme.primaryColor)
                Image(systemName: "chevron.right")
                    .foregroundColor(theme.primaryColor)
            }
            .padding(theme.buttonPadding)
        }
    }
    
    // MARK: - Styling helpers
    private var backgroundView: some View {
        switch buttonType {
        case .primary:
            return AnyView(theme.primaryColor)
        case .secondary:
            return AnyView(Color.white)
        case .nav:
            return AnyView(EmptyView())
        }
    }
    
    private var foregroundColor: Color {
        switch buttonType {
        case .primary:
            return .white
        case .secondary:
            return theme.primaryColor
        case .nav:
            return theme.primaryColor
        }
    }
    
    private var borderView: some View {
        switch buttonType {
        case .primary:
            return AnyView(EmptyView())
        case .secondary:
            return AnyView(
                RoundedRectangle(cornerRadius: theme.buttonCornerRadius)
                    .stroke(theme.primaryColor, lineWidth: 1)
            )
        case .nav:
            return AnyView(EmptyView())
        }
    }
}


#if DEBUG
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
            .padding()
            .previewLayout(.sizeThatFits)
    }
    
    // Wrapper view that can hold @State (for live changes if needed)
    struct PreviewWrapper: View {
        @State private var theme: Theme = BorealisTheme.alaska.theme
        @State private var buttonType: PrimaryButton.ButtonType = .primary
        @State private var isFullWidth: Bool = true
        
        var body: some View {
            VStack(spacing: 20) {
                PrimaryButton(
                    title: "Click Me",
                    theme: theme,
                    buttonType: buttonType,
                    isFullWidth: isFullWidth
                ) {
                    print("Button tapped")
                }
                
                PrimaryButton(
                    title: "Secondary Button",
                    theme: theme,
                    buttonType: .secondary,
                    isFullWidth: false
                )
                
                PrimaryButton(
                    title: "Nav Button",
                    theme: theme,
                    buttonType: .nav,
                    isFullWidth: false
                )
            }
        }
    }
}
#endif

