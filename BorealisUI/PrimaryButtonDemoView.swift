//
//  PrimaryButtonDemoView.swift
//  BorealisUI
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI
import BorealisKit

struct PrimaryButtonDemoView: View {
    @State private var selectedTheme = BorealisTheme.alaska
    @State private var isFullWidth = false
    @State private var buttonType = PrimaryButton.ButtonType.primary
    
    var body: some View {
        VStack(spacing: 0) {
            // Button
            PrimaryButton(
                title: "Visit Alaska",
                theme: selectedTheme.theme,
                buttonType: buttonType,
                isFullWidth: isFullWidth,
                action: nil
            )
            
            // Theme dropdown
            ThemeDropdownView(selectedTheme: $selectedTheme)
                .fixedSize(horizontal: false, vertical: true)
            
            
            VStack(spacing: 24) {
                Picker("Button Type", selection: $buttonType) {
                    ForEach(PrimaryButton.ButtonType.allCases) { type in
                        Text(type.stringValue).tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                // Toggle for full-width
                HStack {
                    Text("Full Width")
                    Spacer()
                    Toggle("", isOn: $isFullWidth)
                        .labelsHidden()
                }
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    PrimaryButtonDemoView()
}
