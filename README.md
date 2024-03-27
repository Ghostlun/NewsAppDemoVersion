# My News App

### Project Overview 
<img align="left" src = "https://github.com/Ghostlun/NewsAppDemoVersion/blob/master/NewsDemo/Resources/Github%20source/icons8-news-100%20(2).png" width = 30 height = 30/>
My News App serves as a dynamic platform for accessing real-time news from various sources.  
It leverages the Rapid News Data API to deliver up-to-the-minute news content, ensuring users have access to the latest information.   
The application is designed to enhance user engagement by providing a seamless navigation experience through lists of news articles and detailed views of selected pieces.

### Key Features
- Real-Time News Updates: The app continuously updates its content, offering fresh news articles from reliable sources.
- Interactive News Lists: Users can browse through lists of news articles, making it easy to find topics of interest.
- Detailed News Views: Selecting an article from the list opens a detailed view where users can read the article in full.
- Content Reporting: Users have the option to report news content if they find it inappropriate, ensuring a safe and respectful news environment.

### How to run?
```terminal
pod install
```
### Used framework.
- pod 'SDWebImage'
- pod 'DropDown'
##### Then, you can start Xcode to run it

### Technical Approach
- MVVM Architecture: The app is structured around the Model-View-ViewModel pattern to enhance testability and maintainability.
- UI Design: A combination of collection and table views offers a rich and intuitive user interface, making news browsing a pleasant experience.
- Error Handling: The app features a custom error-handling framework, ensuring smooth operation and user-friendly error messages.
- Enhanced Accessibility: Recent updates have introduced new font options, allowing users to customize their reading experience.
- Communication Features: Integrated functionalities for emailing, messaging, and making calls support efficient user interactions and inquiries.
- Data Source: <b>Utilizing Rapid API for News Data:</b> The application retrieves its news content from a Rapid API endpoint, which provides a comprehensive and updated news feed.

### User Interface Insights
<b>Recent News Screen</b>  

This initial screen showcases a summary of recent news articles through a combination of collection and table views. The collection view highlights the latest news, while the table view offers keyword searches, such as "Taylor Swift", to tailor the news feed to user preferences.  
<p align="center">
<img src = "https://github.com/Ghostlun/NewsAppDemoVersion/blob/master/NewsDemo/Resources/Github%20source/mainScreen.png" width = 200 height = 410
margin = 20/>
<img src = "https://github.com/Ghostlun/NewsAppDemoVersion/blob/master/NewsDemo/Resources/Github%20source/firstScreen.gif" width = 200 height = 410/>
</p>

<b>Details Screen</b>  

Upon selecting an article, users are directed to this screen where they can access the complete article.   
Features include text resizing for readability and options to report or share the article.

<b>Search News Screen</b>    

This screen allows users to search for articles based on keywords, enhancing the app's functionality by including filters like article count and publication date range.
<p align="center">
<img src = "https://github.com/Ghostlun/NewsAppDemoVersion/blob/master/NewsDemo/Resources/Github%20source/detailsOptions.png" width = 200 height = 410/>
<img src = "https://github.com/Ghostlun/NewsAppDemoVersion/blob/master/NewsDemo/Resources/Github%20source/secondScreen.gif" width = 200 height = 410/>
</p>

<b>Contact Information Screen</b>  

Aimed at providing support, this screen offers users various communication options, including email, messaging, and phone calls, facilitating direct contact with customer service.
<p align="center">
<img src = "https://github.com/Ghostlun/NewsAppDemoVersion/blob/master/NewsDemo/Resources/Github%20source/detailsOption.png" width = 200 height = 410/>
<img src = "https://github.com/Ghostlun/NewsAppDemoVersion/blob/master/NewsDemo/Resources/Github%20source/thirdScreen.gif" width = 200 height = 410/>
</p> 
