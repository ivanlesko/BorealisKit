//
//  PrimaryButton.swift
//  BorealisKit
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI

public struct PrimaryButton: View {
    // Public properties so the app using the package can customize
    public let title: String
    public let action: () -> Void
    public let theme: Theme
    
    // Public initializer
    public init(title: String, theme: BorealisTheme, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.theme = theme.theme
    }
    
    // The UI
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(theme.buttonPadding)
                .background(theme.primaryColor)
                .cornerRadius(10)
        }
    }
}

// Preview for testing in a host app or DemoApp
#if DEBUG
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryButton(title: "Click Me", theme: BorealisTheme.Alaska) {
                print("Button tapped")
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
