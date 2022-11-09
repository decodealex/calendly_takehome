# Calendly
This is the Calendly takehome app that makes use of the API at https://github.com/decodealex/CalendlyNetworkManager

## Build tools & versions used
- Xcode 14.1
- Swift 5

## Steps to run the app
- Run the app through Xcode with the 'takehome' scheme on any iPhone device.   If this fails, try clicking File > Packages > Update to Latest Package Versions to make sure that Swift Package Manager dependencies were downloaded successfully.

## My focus:
I focused on modularity and extensibility.
- Modularity: The API is separated into a Swift Package so that it can be wholly separate from the actual app.  This allows us to test the API client and manage its releases wholly independently from the app.
- Extensibility: Anything that could be modeled as a protocol with conforming implementations was.  The reason for doing this was so that we can easily add new features to the app by either adding to the protocols, creating new protocols that the implementations could conform to, or even trading out the existing implementations of components for pretty anything that conforms to the same protocol.  Essentially, I tried to take as much of a protocol-oriented programming approach as possible.  In past projects, this has helped immensely with unit testing and refactoring.
- Object dependencies are injected, not hard coded. 
- DI injection relies on protocols, and not on objects, so we can easily inject another object (for example, for testing purposes)
- UI elements are created with reusability potential. 
- Implemented refresh functionality for ET
- Updated ET view to look more like Calendly app
- Removed duplicated code from DataStores
- Implemented Unit tests for DataStores, JSONMapping, ViewModel (basic test cases) 
- WIP: Account view. Unfortunately I didnt have enough time to finish this module. Only basic UI is implemented 
- There is basic support for Dark Mode, so feel free to take a look on a phone that's in Dark Mode as well as one that's in Light Mode.



# Instructions

1. Create a free Calendly account at Calendly's [website](https://calendly.com).
2. Generate your personal access token for the Calendly API by following the instructions listed [here](https://developer.calendly.com/how-to-authenticate-with-personal-access-tokens).
3. Create a file named `takehome/Assets.xcassets/PersonalAccessToken.dataset/pat` with your personal access tokens as its contents.
4. Verify that you can build the project in Xcode and run the application in the iOS simulator. You should see your Event Types listed.
5. Implement improvements to the sample application. You can pick one or multiple items from the list below. Or you can focus on your own idea.

# Possible Improvements

1. Update Event Types screen to look more like the published Calendly app
2. Add an error state to the Event Types screen
3. Find and fix bugs
4. Add tests (What should be tested? Does some code need to be refactored to make it testable?)
5. Add pagination to ET list
6. Refactor repository and data source classes to reduce duplicated code
7. Add refresh functionality to ET list
8. Create an Account screen using SwiftUI

