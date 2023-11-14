# News App 

## Overview
The News App is a mobile application designed to store and present news articles fetched from the News API. The app features two main screens: the News Sources Listing Screen and the News Listing Screen. Users can explore various news sources, filter news by categories, and read the latest articles from a selected source.

## Features

### News Sources Listing Screen
- Display a list of news sources.
- Show the name and description of each news source.
- Filter news sources to only display those with the English language (en).
- Allow users to store news sources by categories, with the ability to select multiple categories.
- Retrieve the category list via the news sources list.

### News Listing Screen

- Accessible by selecting a news source from the News Sources Listing Screen.
- Display news articles from the selected source, featuring the image, title, and publication date.
- List the most current news at the top.
- Showcase the top three news articles in a slider with automatic color changes.
- Optionally, refresh the news from the API every minute and update the page if new articles are added.

### Reading List (Optional)
- Allow users to add news articles to their reading list for later reference.
- Provide an "Add to my reading list" button in the news list.
- If a news article is added to the reading list, change the button text to "Remove from my reading list."
- The reading list is stored locally on the device without the need for a separate page.
## API Endpoints
API: https://newsapi.org/
1. News Sources Listing: /v2/sources
2. News Listing: /v2/top-headlines


## Installation

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on a simulator or a physical device.

   ### APIKey Installation Sheme

   This project demonstrates a secure way to manage API keys using a configuration file (Config.xcconfig). For this example, we'll use the newsapi.org API as a case study.

   Create SecureAPIKeys Directory:

   Create a directory named SecureAPIKeys in your Xcode project.
   Create Config.xcconfig File:

   Inside the SecureAPIKeys directory, create a file named Config.xcconfig.
   Add API Key:

   API_KEY = "your_newsapi.org_api_key_here"


## Contributor

- [Gizem Turker](https://github.com/gizemturker) - Main Developer

