//
//  ThemePickerView.swift
//  BorealisUI
//
//  Created by IvanL on 9/17/25.
//

import SwiftUI
import BorealisKit

struct ThemeDropdownView: View {
    @State private var selectedTheme: BorealisTheme = .alaska
    
    var body: some View {
        VStack() {
            Menu {
                ForEach(BorealisTheme.allCases) { theme in
                    Button(action: { selectedTheme = theme }) {
                        Text(theme.rawValue.capitalized)
                    }
                }
            } label: {
                HStack {
                    Text("Selected Theme: \(selectedTheme.rawValue.capitalized)")
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
    static var previews: some View {
        ThemeDropdownView()
    }
}
