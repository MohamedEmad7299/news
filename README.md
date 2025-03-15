# 📰 News App

A **News App** that fetches and displays the latest news from an API like [NewsAPI](https://newsapi.org/) using **Dio** and **Bloc for state management**.

## 📌 Features
✅ Fetch and display top headlines from different countries
✅ Search for news articles by keyword
✅ View full news details in WebView
✅ Light/Dark mode support
✅ Smooth scrolling with `ListView.builder`

---

## 🚀 Installation

### **1. Clone the Repository**
```sh
git clone https://github.com/your-username/flutter-news-app.git
cd flutter-news-app
```

### **2. Install Dependencies**
```sh
flutter pub get
```

### **3. Run the App**
```sh
flutter run
```

---

## 🛠️ Dependencies Used
```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.0.0 # For API requests
  webview_flutter: ^4.4.4 # To open news in a web view
  flutter_bloc: ^8.1.2 # For state management
  shared_preferences: ^2.2.0 # For theme saving
```

---

## 📡 API Integration
This app fetches news from [NewsAPI.org](https://newsapi.org/). To use the API:
1. **Sign up on [NewsAPI](https://newsapi.org/) and get your API Key.**
2. **Add your API key in the `api_service.dart` file:**
   ```dart
   const String apiKey = 'YOUR_API_KEY';
   ```
3. The API call example:
   ```dart
   final response = await dio.get(
     'https://newsapi.org/v2/top-headlines',
     queryParameters: {
       'country': 'eg', // Change country code if needed
       'apiKey': apiKey,
     },
   );
   ```

---

## 📷 Screenshots
|-------------|-------------|
| ![1](./assets/a.jpg) | ![2](./assets/b.jpg)  ![3](./assets/c.jpg) | ![4](./assets/d.jpg)|

---

## 🎯 How It Works
- The app fetches news articles from NewsAPI based on the selected country.
- It uses **Dio** for API calls and **Bloc** for state management.
- Clicking a news item opens it in a **WebView**.
- Users can toggle **light/dark mode**.

---

## 💡 TODO
- [ ] Add category filters (Sports, Technology, Business, etc.)
- [ ] Implement pagination for loading more news
- [ ] Add localization for multiple languages

---

## 🏆 Contributing
Feel free to **fork** this repo, improve the app, and submit a **pull request**!

---

## ⭐ Show Some Love
If you like this project, give it a ⭐ on GitHub!

