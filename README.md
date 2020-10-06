[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/adrianodiasx93/TheFeels">
    <img src="TheFeels/Resources/Assets.xcassets/feedback.imageset/feedback.svg" alt="Logo" width="100" height="100">
  </a>

  <h3 align="center">The Feels</h3>

  <p align="center">
    Analyze the sentiments of tweets!
    <br />
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Features](#features)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Technical](#Technical)
  * [Written in](#written-in)
  * [Principles](#principles)
  * [Architeture](#architeture)
  * [Modularization](#modularization)
  * [Patterns](#patterns)
  * [Folder Structure](#folder-structure)
  * [Unit tests](#unit-tests)
  * [Dependencies](#dependencies)
* [Roadmap](#roadmap)
  * [TO-DO](#to-do)  
* [License](#license)
* [Contact](#contact)
  * [Projects](#projects) 
  
<!-- ABOUT THE PROJECT -->
## About The Project

The main goal of this project is to demonstrate my knowledge with a few of the technologies and concepts I have been working with for the past few years. Although its straightforward use, sentiment analysis of tweets, the choices made in this app intend to cover projects that might grow exponentially and have as key factors: layer segregation, build time, maintainability, testatibility, among another real world features. Besides all that, you can also have some fun analyzing the sentiment of texts publically tweeted by any searched twitter user.

<!-- Features -->
### Features

The features are the following:

* [Search Twitter's users by username;](https://github.com/adrianodiasx93/TheFeels/issues/18)
* [Show public tweets from selected user;](https://github.com/adrianodiasx93/TheFeels/issues/22)
* [Analyze the sentiment expressed in such tweets simultaneously.](https://github.com/adrianodiasx93/TheFeels/issues/37)

Their development progress is detailed in the [Project Management](https://github.com/adrianodiasx93/TheFeels/projects/1) section.

<!-- GETTING STARTED -->
## Getting Started

For starters go on and clone this repository. In oder to run this project you will need Xcode and usually a mac ([*ba dum tss*](https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQmirkQT8_SU48PedBZl6Eydn5IZxBxwpDQUA&usqp=CAU)), but you also gonna need the following.

### Prerequisites

* [Bundler](https://bundler.io/)
* [Cocoapods](https://cocoapods.org/)
* [Cocoapods-keys](https://github.com/orta/cocoapods-keys)
* Keys and tokens for [Twitter API](https://developer.twitter.com/)

### Installation

After installing [bundler](https://bundler.io/), run in your terminal:

```sh
bundle install
```
It will install the remaining gems, and now you can run:

```sh
pod install
```

which will install the projet dependencies needed and prompt you for the keys & tokens you obtained from Twitter. Such credentials will be stored only locally at your keychain and will be ignored from git history (vide [cocoapods-keys guidelines](https://github.com/orta/cocoapods-keys)). Finally you may open `TheFeels.xcworkspace` and run the project in the simulator or in your device by renaming its bundle identifier.

<!-- TECHNICAL -->
## Technical

### Written in

This appiclation is written fully in Swift and applies Codable, Equatable, Hashable, Higher order functions, Extensions, Associated Types, Typealias, Generics, among many others of its features.

### Principles

This project follows the [S.O.L.I.D. Principles](https://medium.com/flawless-app-stories/s-o-l-i-d-principle-with-swift-b42f597ba7e2).

### Architeture

This project is architectured following the concepts of Clean Architeture(https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

### Modularization

This project is organized in modules primarily following the segregation of layers presented by Clean Architeture. Also, each layer has its own segregation.

* Domain
* Data
  * AppData
  * Networking
  * Storage
* Presentation
  * AppNavigation
  * Common
  * User
  * Tweet
* DI (Dependency Injection)
* Main

### Patterns

* Model-View-ViewModel
* Coordinator
* Delegation

### Folder Structure

Besides being physically divied by modules, each module has its files grouped by its reponsibility.

### Unit tests

Each module has its own group of unit tests, as well the necessaries components (spies, stubs, fakes) for such tests. This project uses `XCTest`, assisted by `RxTest` & `RxBlocking` for Rx classes.

### Dependencies

This project uses dependencies managed by [Cocoapods](https://cocoapods.org/). Each dependency is available only for its necessary modules.

#### Shared Pods

* [SwiftLint](https://github.com/realm/SwiftLint): A tool to enforce Swift style and conventions.
* [Fakery](https://github.com/vadymmarkov/Fakery): Generates fake data. In association with `Fakeable`, a `protocol` of mine, `Models` can be randomly generated.
* [RxSwift](https://github.com/ReactiveX/RxSwift): High level abstraction, reactive, functional and declarative programming. 😍
* [RxSwiftExt](https://github.com/RxSwiftCommunity/RxSwiftExt): Useful and conveniente extensions for Rx.

#### Testing Pods

* [RxTest](https://github.com/vadymmarkov/Fakery) & [RxBlocking](https://github.com/vadymmarkov/Fakery): For testing in the Rx way.

#### Presentation Pods

* [SwiftGen](https://github.com/SwiftGen/SwiftGeny): Type-safe them all.
* [Kingfisher](https://github.com/onevcat/Kingfisher): Downloading and caching of images from the web.
* [lottie-io](https://github.com/airbnb/lottie-ios): Loadings should be pretty.
* [RxCocoa](https://github.com/vadymmarkov/Fakery): Rx capabilities for Cocoa APIs. Extra points for [Driver](https://github.com/ReactiveX/RxSwift/blob/main/Documentation/Traits.md#driver).
* [RxSwiftUtilities](https://github.com/RxSwiftCommunity/RxSwiftUtilities): Track progress of stream events. Basically it tells when to start/stop loading.
* [RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources): Upgraded Rx way of binding your datasource to your TableView/CollectionView.

#### DI Pods

* [Swinject](https://github.com/Swinject/Swinject): Well-known framework for dependency injection.
* [SwinjectAutoregistration](https://github.com/Swinject/SwinjectAutoregistration): Automate the dependencies registrations in a generic way and reduce their boilerplate.

#### NetworkingPods

* [OxeNetworking](https://github.com/adrianodiasx93/OxeNetworking-iOS): Created by a good friend of mine, this framework is a network layer abstraction using Alamofire and Moya. And it also provides integration with RxSwift.
* [AlamofireNetworkActivityLogger](https://github.com/konkab/AlamofireNetworkActivityLogger): For logging network activity.
* [OAuthSwift](https://github.com/OAuthSwift/OAuthSwift):  Acessing of OAuth protected endpoints, for instance the one for [searching twitter users by query](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-search). 


<!-- ROADMAP -->
## Roadmap

This app has many spaces for improvement, and I intend to fill them in them following moments. In the next section you may read some of them.

### TO-DO

- [ ] Replace [current](https://sentim-api.herokuapp.com/) sentiment analysis for the one provided by [Google](https://cloud.google.com/natural-language/)* or better alternative.
- [ ] Improve layout by showing more information (hashtags, mentions, photos, etc..) for each tweet.
- [ ] Cache searches and analysis, providing a offline-first behavior.


*: At the moment of this writing, it was not possible to register for a free trial due to a system malfunction. 
<!-- LICENSE -->
## License

Distributed under the MIT License. See [LICENSE](https://github.com/adrianodiasx93/TheFeels/blob/main/LICENSE) for more information.

<!-- CONTACT -->
## Contact

Adriano Dias - [adrianodsilva](https://www.linkedin.com/in/adrianodsilva/)

<!-- PROJECTS -->
### Projects

[TheFeels](https://github.com/adrianodiasx93/TheFeels)

[OxeNetworking](https://github.com/adrianodiasx93/OxeNetworking-iOS)

[UDTM](https://github.com/adrianodiasx93/udtm)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/adrianodiasx93/TheFeels/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=flat-square
[forks-url]: https://github.com/adrianodiasx93/TheFeels/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=flat-square
[stars-url]: https://github.com/adrianodiasx93/TheFeels/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/adrianodiasx93/TheFeels/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/adrianodiasx93/TheFeels/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/adrianodsilva/
[product-screenshot]: images/screenshot.png
