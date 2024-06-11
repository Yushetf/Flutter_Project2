# Bar Finders!
## Workspace

  · Github: https://github.com/Yushetf/Flutter_Project2

  · Releases: https://github.com/Yushetf/Flutter_Project2/releases

  · Workspace: https://upm365.sharepoint.com/sites/Tracking12/SitePages/Tracking.aspx

## Description

With the Bar Finders! application, you can find the nearest bars or restaurants in a matter of seconds based on our current location, and you can also indicate the maximum distance at which you want these bars or restaurants to appear. Additionally, we can automatically store in a list the bars that were available when we last used the application, as they will be saved in a database. We can also search by name among the bars that have appeared to us previously on the map.
Thanks to Bar Finders!, we will save time by not having to filter the type of place we want to search for, as it focuses exclusively on bars or restaurants.

## Screenshots and navigation

![Login screen.](https://github.com/Yushetf/Flutter_Project2/blob/master/Screenshots/Inicio%20sesionRegistro.png)
Login/register

![Main map screen.](https://github.com/Yushetf/Flutter_Project2/blob/master/Screenshots/Mapa.png)
Main map Screen

![Map features.](https://github.com/Yushetf/Flutter_Project2/blob/master/Screenshots/Distancia.png)
Map feature (Set distance)

![List.](https://github.com/Yushetf/Flutter_Project2/blob/master/Screenshots/Lista.png)
List of restaurants

## Demo Video
[Demo](https://upm365-my.sharepoint.com/personal/yushetf_lopez_jimenez_alumnos_upm_es/_layouts/15/stream.aspx?id=%2Fpersonal%2Fyushetf%5Flopez%5Fjimenez%5Falumnos%5Fupm%5Fes%2FDocuments%2FScreen%5Frecording%5F20240611%5F171108%2Ewebm&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0&ga=1&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2E52363e55%2D9d1b%2D4617%2Da09b%2D47c18977b9d0)

## Features

**Functional features:**

**------------------------------------------------------------------------------------------**

  · Search for bars or restaurants.

  · Bars or restaurants available are placed on the map.

  · A list is created with the available bars or restaurants so that we can see the names of those available establishments.

  · You can specify the maximum distance at which you want bars or restaurants to appear.

**Technical features:**

**------------------------------------------------------------------------------------------**

  · Firebase Authentication: Implements user authentication using Firebase Authentication for sign-in and registration (SignInScreen, AuthGate).

  · State Management: Utilizes Flutter's Provider package for state management (AppConfig, RestaurantsMapsState).

  · Map Integration: Integrates OpenStreetMap using Flutter's flutter_map package, displays map tiles, and markers for bars (MapScreen).

  · Local Database: Implements a local SQLite database using the sqflite package for storing location data (DatabaseHelper, Coord).

 · UI Components: Implements various UI components such as Buttons, EditText, TextView, ListView, etc., for user interaction and display.

· Asynchronous Operations: Uses Dart's async and await for handling asynchronous operations, such as HTTP requests and database operations (MapScreen, ThirdScreen).

· Alert Dialogs: Displays AlertDialogs for user input and notifications (MapScreen).

· Bottom Navigation: Utilizes Flutter's BottomNavigationBar for navigation between different screens (MainScreen).

· Data Models: Utilizes Dart classes to represent JSON responses from the Overpass API (Bar, Coord, Element, Osm3s, OverpassResponse).

· Permission Handling: Requests and checks permissions for accessing device location (MapScreen).

· File Operations: Performs file read and write operations using Dart's path_provider package (writeData, readData).

· Firebase Initialization: Initializes Firebase using the firebase_core package and platform-specific configurations (main.dart, firebase_options.dart).

## How to Use
· First step: We enter the application and log in or register with our email account.
  
· Second step: We can access the map and see the restaurants or bars within a default distance from us.

· Third step: We can modify that distance. To do this, we need to press the button (located at the bottom right) and enter the desired distance. Press OK.
Now, the bars within the maximum distance we just entered will appear.

· Fourth step: We can view a list of available bars or restaurants if AFTER using the map, we go to the map button. There, the names of the bars or restaurants will appear.
    
## Participants

List of Flutter_Project2 developers:

  · Yushetf López Jiménez (yushetf.lopez.jimenez@alumnos.upm.es)

  · Jaime Pastor Ocariz (jaime.pastor.ocariz@alumnos.upm.es)
