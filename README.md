# AERightMenuWindow
A generic approach for iOS to show view controller as side right menu


## Setup
### Using [CocoaPods](http://cocoapods.org)
1. Add the pod `PureLayout` to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html).

  ```ruby
  pod 'AERightMenuWindow'
  ```

1. Run `pod install` from Terminal, then open your app's `.xcworkspace` file to launch Xcode.
1. Import the `PureLayout.h` umbrella header.
    * Objective-C: `#import "AERightMenuWindow.h"`

That's it - now go write a menu with AERightMenuWindow!

## Usage
### Sample Code (Objective-C)
PureLayout dramatically simplifies writing Auto Layout code. Let's take a quick look at some examples, using PureLayout from Swift.

Here's a constraint between two views created (and automatically activated) using PureLayout:

```objective-c
UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
MenuViewController *frontController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
[[AERightMenuWindow instance] showMenu:frontController];
```

## Meta
Originally designed & built by William ([@canicelebrate](https://github.com/canicelebrate)). Distributed with the MIT license.
