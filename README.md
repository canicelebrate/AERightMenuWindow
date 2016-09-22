# AERightMenuWindow
A generic approach for iOS to show view controller as side right menu and inspired by 唐巧 who is the author of the book \<iOS进阶开发\>. You can find some usable knowledge about UIWindow from chapter 12 of the book.

## Implementation
  Utilize UIWindow to show a view controller as a right side menu. You can specify the width percentage of menu view related to the full screen.
  Also, you can set the dropback color(normally it's a semi-transparent color) and the animation duration for showing the side menu.

## Setup
### Using [CocoaPods](http://cocoapods.org)
1. Add the pod `AERightMenuWindow` to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html).

  ```ruby
  pod 'AERightMenuWindow'
  ```

1. Run `pod install` from Terminal, then open your app's `.xcworkspace` file to launch Xcode.
1. Import the `AERightMenuWindow.h` umbrella header.
    * Objective-C: `#import "AERightMenuWindow.h"`

That's it - now go write a menu with AERightMenuWindow!

## Usage
### Sample Code (Objective-C)
AERightMenuWindow simplifies writing right side menu layout in you app. Let's take a quick look at an example,

Here's a view controller loaded from storyboard and it utilizes AERightMenuWindow to display itself as a right side menu in a designated window.

```objective-c
UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
MenuViewController *frontController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
[[AERightMenuWindow instance] showMenu:frontController];
```

## Meta
Originally designed & built by William ([@canicelebrate](https://github.com/canicelebrate)). Distributed with the MIT license.
