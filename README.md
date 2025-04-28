# Book App

A mobile application that allows users to browse and search for books with a responsive UI, offline image caching, and smooth animations. The app uses several packages to manage dependencies, state, UI responsiveness, and HTTP requests, enhancing the user experience on both Android and iOS platforms.

## Packages Used

### 1. **flutter_screenutil**
   - **Purpose**: Handles screen size responsiveness across different devices. This package ensures that the UI adjusts properly according to the screen dimensions, making the app adaptive to various screen sizes and orientations.

### 2. **flutter_native_splash**
   - **Purpose**: Manages the native splash screen for Android and iOS, providing a smooth transition between the app startup and the first screen.

### 3. **cached_network_image**
   - **Purpose**: Handles caching of network images for offline use. It helps to load images faster by saving them in the cache, improving performance and user experience.

### 4. **font_awesome_flutter**
   - **Purpose**: Provides access to Font Awesome icons for a broader set of icons compared to the default Material icons.

### 5. **flutter_bloc**
   - **Purpose**: Implements state management using the BLoC (Business Logic Component) pattern. It helps manage the state of the app, such as loading books, handling search, pagination, and error states.

### 6. **dio**
   - **Purpose**: A powerful HTTP client for Dart used to handle network requests. It supports features like interceptors, global configuration, form data, request cancellation, and file downloading.

### 7. **dartz**
   - **Purpose**: Provides functional programming features in Dart, such as Option, Either, and Try, for safer and more expressive code.

### 8. **shimmer**
   - **Purpose**: Adds shimmer effects for loading states, improving the user experience by providing a smooth animation while content is loading.

### 9. **get_it**
   - **Purpose**: A simple service locator for Dart and Flutter that handles dependency injection, making it easier to manage dependencies and improve testability in the app.

## Project Setup

- **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/book_app.git
   cd book_app

## Screens of the App

### 1. **Native Splash Screen (Android & iOS)**

   - When the app is launched, a smooth native splash screen is displayed on both Android and iOS platforms. This splash screen is managed using the `flutter_native_splash` package and provides a seamless transition as the app loads.
<img src="https://github.com/user-attachments/assets/863ee1da-ad02-4cb3-aa07-1a46d57487b3" width="300"/>

### 2. **Onboarding Screen**

   - The onboarding screen provides an introduction to the app and its features. It is displayed when the app is first launched and helps users understand the app's functionality. The onboarding process is designed to be visually engaging and informative, guiding users through the initial setup.
<img src="https://github.com/user-attachments/assets/7744d177-bcd0-4155-a7c6-9aa4c12da92b" width="600"/>

### 3. **Initial Home Screen**

   - The home screen displays a list of books fetched from an API. The user can view book details such as the title, author, and cover image. It is designed to be clean and user-friendly, offering quick access to browse through available books.
<img src="https://github.com/user-attachments/assets/887a9a13-b19f-4a4d-8520-e8e6dfd46344" width="600"/>

### 4. **Pagination in Home Screen (Scrolling Down)**

   - The home screen supports pagination. As the user scrolls down, more books are loaded automatically. The pagination logic ensures that the app remains responsive and doesn't load excessive amounts of data at once. This is achieved by utilizing the `flutter_bloc` package to manage the loading states and book retrieval.
<img src="https://github.com/user-attachments/assets/040235d0-9464-490f-8e1a-46203815bc46" width="600"/>

### 5. **Search Functionality**

   - The app allows users to search for books by title or author. As the user types in the search bar, a debounce mechanism is used to prevent unnecessary API calls, ensuring that search results are updated after a short delay (500 milliseconds). The search results are displayed dynamically below the search input.
<img src="https://github.com/user-attachments/assets/8cd15f63-5b4c-4c7b-a496-2077bc4f625b" width="600"/>

### 6. **Expanded Summary of a Book**

   - Each book has a summary section that can be expanded or collapsed. This is handled through a toggle mechanism. When a user taps on a book's summary, it expands to reveal a more detailed description. The expansion and collapse of the summary are managed with the `flutter_bloc` state management solution, providing a smooth and interactive experience.
<img src="https://github.com/user-attachments/assets/e304742e-2ef9-4a9b-9d2e-ac215b7ba331" width="600"/>
