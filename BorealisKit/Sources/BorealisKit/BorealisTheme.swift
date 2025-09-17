//
//  Theme.swift
//  BorealisKit
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI

public struct Theme {
    public let primaryColor: Color
    public let secondaryColor: Color
    public let accentColor: Color
    public let buttonCornerRadius: CGFloat
    public let buttonPadding: CGFloat
    
    public init(
        primaryColor: Color,
        secondaryColor: Color,
        accentColor: Color,
        buttonCornerRadius: CGFloat,
        buttonPadding: CGFloat
    ) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.accentColor = accentColor
        self.buttonCornerRadius = buttonCornerRadius
        self.buttonPadding = buttonPadding
    }
}

public enum BorealisTheme {
    case Alaska
    case AlaskaClassic
    case Hawaaian
    
    var theme: Theme {
        switch self {
        case .Alaska:
            Theme(primaryColor: Color(hex: "#00426A"),
                  secondaryColor: Color(hex: "003761"),
                  accentColor: .black,
                  buttonCornerRadius: 8,
                  buttonPadding: 12)
        case .AlaskaClassic:
            Theme(primaryColor: Color(hex: "#0274CA"),
                  secondaryColor: Color(hex: "00274a"),
                  accentColor: .black,
                  buttonCornerRadius: 8,
                  buttonPadding: 12)
        case .Hawaaian:
            Theme(primaryColor: Color(hex: "#463C8F"),
                  secondaryColor: Color(hex: "#29315c"),
                  accentColor: .black,
                  buttonCornerRadius: 8,
                  buttonPadding: 12)
        }
    }
}
