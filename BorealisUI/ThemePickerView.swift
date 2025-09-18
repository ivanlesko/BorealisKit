//
//  ThemePickerView.swift
//  BorealisUI
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI
import BorealisKit

struct ThemeDropdownView: View {
    @Binding var selectedTheme: BorealisTheme
    
    var body: some View {
        VStack {
            Menu {
                ForEach(BorealisTheme.allCases) { theme in
                    Button(action: { selectedTheme = theme }) {
                        Text(theme.displayString)
                    }
                }
            } label: {
                HStack {
                    Text(selectedTheme.displayString)
                    Image(systemName: "chevron.down")
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}

// Preview
struct ThemeDropdownView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var theme: BorealisTheme = .alaska
        
        var body: some View {
            ThemeDropdownView(selectedTheme: $theme)
        }
    }
    
    static var previews: some View {
        PreviewWrapper()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
