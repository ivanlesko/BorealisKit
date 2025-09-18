# BorealisKit

**BorealisKit** is a small SwiftUI component library providing reusable UI elements like buttons and cards with theming support, designed to let you quickly build consistent multi-branded interfaces. 

![SwiftUI](https://img.shields.io/badge/SwiftUI-5.5-orange)

---

## Features

- **PrimaryButton** – a highly customizable button component with three types:
  - `primary` – solid button with theme color background  
  - `secondary` – outlined button with theme color border  
  - `nav` – simple text with chevron for navigation  

- **Card** – a flexible card component with:
  - Optional image  
  - Title, subtitle, and paragraph  
  - CTA button using `PrimaryButton`  
  - Theming support 

- **FeatureBanner** – a full-width banner component for highlighting content:
  - Headline and description text  
  - Optional left image with configurable shape (`circle` or `square`)  
  - Optional background image with overlay  
  - CTA button using `PrimaryButton`  
  - Fully reactive to SwiftUI state   

- Fully reactive and configurable via SwiftUI state  

---

## Installation

### Swift Package Manager

Add this package to your Xcode project:  

```
https://github.com/ivanlesko/BorealisKit
```

## Usage

### PrimaryButton

```swift
import SwiftUI
import BorealisKit

struct ContentView: View {
    @State private var theme = BorealisTheme.alaska.theme
    @State private var buttonType: PrimaryButton.ButtonType = .primary

    var body: some View {
        PrimaryButton(
            title: "Click Me",
            theme: theme,
            buttonType: buttonType,
            isFullWidth: true
        ) {
            print("Button tapped")
        }
        .padding()
    }
}
```

### Card
```swift
import SwiftUI
import BorealisKit

struct CardDemoView: View {
    var body: some View {
        Card(
            imageURL: URL(string: "https://images.contentstack.io/.../honolulu.webp"),
            title: "Honolulu Getaway",
            subtitle: "Sunny beaches and perfect waves",
            paragraph: "Experience the best of Honolulu with our exclusive travel packages...",
            ctaTitle: "Book Now",
            ctaAction: { print("CTA tapped!") },
            theme: BorealisTheme.alaska.theme,
            buttonType: .primary,
            isFullWidthCTA: true
        )
        .padding()
    }
}
```

### FeatureBanner
```swift
import SwiftUI
import BorealisKit

struct BannerDemoView: View {
    var body: some View {
        FeatureBanner(
            headline: "Island Adventure Awaits",
            description: "Golden beaches, lush rainforests, and vibrant marine life await you on your next Hawaiian getaway.",
            theme: BorealisTheme.hawaaiian.theme,
            backgroundImageURL: "https://images.contentstack.io/.../hawaii_background.jpg",
            backgroundOverlay: Color.white.opacity(0.5),
            imageShape: .circle,
            imageURL: "https://images.contentstack.io/.../hawaii_hero.jpg",
            ctaType: .primary,
            ctaTitle: "Plan Your Trip",
            ctaAction: { print("CTA tapped") }
        )
        .padding()
    }
}
```
