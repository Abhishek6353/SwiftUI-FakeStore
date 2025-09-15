# SwiftUI Fake Store 🛍️

A modern e-commerce demo app built with SwiftUI, Firebase Authentication, Firestore, and SDWebImageSwiftUI for image caching. This app demonstrates best practices for MVVM architecture, and robust user experience.

## Screenshots

<p float="left">
  <img src="Screenshots/1_login.png" width="250" />
  <img src="Screenshots/2_signup.png" width="250" />
  <img src="Screenshots/3_ForgotPassword" width="250" />
   <img src="Screenshots/4_Home" width="250" />
   <img src="Screenshots/5_ProfuctDetails" width="250" />
</p>


## Features

- **Product Listing**: Browse products with cached images and smooth navigation.
- **Product Details**: View product info, price, rating, category, and description.
- **Authentication**: Login, signup, and forgot password flows using Firebase Authentication.
- **User Data**: Store user info securely in Firestore on account creation.
- **Image Caching**: SDWebImageSwiftUI for fast, efficient image loading and caching, with placeholders and error handling.
- **Input Validation**: Robust email and password validation for authentication flows.
- **Keyboard Management**: Automatic keyboard dismissal and smooth field navigation.

## Getting Started

### Prerequisites
- Xcode 13+
- Swift 5.5+
- Firebase project with iOS app registered

### Setup
1. Clone this repository.
2. Open `FakeStore.xcodeproj` in Xcode.
3. Add your `GoogleService-Info.plist` to the `FakeStore` directory.
4. Install dependencies via Swift Package Manager:
   - [Firebase](https://github.com/firebase/firebase-ios-sdk)
   - [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)
5. Build and run the app on a simulator or device.

## Architecture
- **MVVM**: All business logic is handled in ViewModels, keeping views clean and testable.
- **AuthManager**: Centralized authentication logic for login, signup, logout, and password reset.
- **InputValidator**: Helper for robust input validation (email, password).

## License
This project is licensed under the MIT License.

## Credits
- [Firebase](https://firebase.google.com/)
- [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)
- [SwiftUI](https://developer.apple.com/xcode/swiftui/)

---

For questions or contributions, feel free to open an issue or pull request.
