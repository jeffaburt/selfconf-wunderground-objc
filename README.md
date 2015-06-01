# selfconf-wunderground-objc
Weather Underground Sample App in Obj-C for self.conf

Prerequisites
-------------

To build the app, you’ll need Xcode 6.2.x (NOTE: Functional tests may not work with Xcode 6.3.x). 

For library dependencies, you’ll need to install [CocoaPods](http://www.cocoapods.org).

To run functional tests via calabash, you'll need to install the [calabash gem](http://calaba.sh/).

To make API calls to Weather Underground, you'll need an [API Key](http://www.wunderground.com/weather/api/).
Once you have a key, edit the Info.plist file in the SunnyDaze target to add a key named "weatherUndergroundAPIKey".
Add your Weather Underground API key as the string value.

Getting Started
---------------

Once you’ve cloned the repository to your Mac, open Terminal and navigate to its root folder. To install the required CocoaPods libraries, run the following command:

    pod install
    
**Note**: You’ll encounter errors in Xcode if you open `SunnyDaze.xcproj` instead of `SunnyDaze.xcworkspace`. If you don’t have the latter, ensure you’ve run `pod install` and that it succeeded.

Targets
-------

The app has four targets:

* **SunnyDaze**: This target is the main app. Unit tests can be run against this target using ⌘-U.
* **SunnyDazeTests**: This target contains the unit tests for the Location Entry and Weather Service. You will not need to run this target directly.
* **SunnyDaze-cal**: This is the target for calabash that injects an HTTP server in the app when it runs so calabash can interact with it. You will need to run this target when you want to make changes to your app that can be tested by calabash.
* **SunnyDaze Acceptance Tests**: This target contains the Kiwi-KIF functional tests. Run these tests using ⌘-U.
 
Running Calabash Tests
----------------------

* Open a terminal to the SunnzyDaze directory
* Type 'cucumber' in the command line
* A simulator will open and run through your *.features files in the features directory
* If you make updates to the SunnyDaze app, you will need to run the SunnyDaze-cal target to rebuild and install the app for calabash testing

