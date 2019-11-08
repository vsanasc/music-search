# Music Search App

> 

[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

## Features

- [] List songs from API Server
- [] Show detail each song


## Requirements

- iOS 11.0+
- CocoaPods

#### Libraries

```ruby
pod 'SwiftLit'
pod "PromiseKit", "~> 6.8"
pod 'RxSwift', '~> 5'
pod 'RxCocoa', '~> 5'
pod 'Mockingjay', '3.0.0-alpha.1'
```

## Trello

> How this is only a demo app, I don't use agile methodology, but in the same way, I use a Trello board. You can see this one in the following link: 


https://trello.com/b/tq8X8DRC/music-search

## Architecture

> This app has three targets for app and two for tests:

- MusicSearch
- MusicSearchIOS
- MusicSearchKit
- MusicSearchIOSTests
- MusicSearchKitTests

The Advanced iOS App Architecture Book inspires this approach. The are many other functional architectures like VIPER, MVP, Redux, but for me, this approach it's better because it follows the SOLID concepts in depth. For example, we can use the MusicSearchKit (models, view models, data source, Foundation elements, etc.) in a Cocoa project to creating an OS X app.


## Meta

Vitor Santos – [@vsanasc](https://twitter.com/vsanasc) – vsantos.nasc@gmail.com

Distributed under the BSD license. See ``LICENSE`` for more information.

[https://github.com/vsanasc](https://github.com/vsanasc)