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
* [Usage](#usage)
* [Written in](#written-in)
  * [Swift Features](#swift-features)
* [Architeture & Patterns](#architeture-and-patterns)
  * [Architeture](#architeture)
  * [Patterns](#patterns)
* [Dependencies](#architeture-and-patterns)
  * [Internal Modules](#modules)
  * [Pods](#pods)  
* [Roadmap](#roadmap)
  * [TO-DO](#todo)  
* [License](#license)
* [Contact](#contact)
  * [Projects](#projects) 
  
<!-- ABOUT THE PROJECT -->
## About The Project

The main goal of this project is to demonstrate my knowledge with a few of the technologies and concepts I have been working with for the past few years. Although its straightforward use, sentiment analysis of tweets, the choices made in this app intend to cover projects that might grow exponentially and have as key factors: layer segregation, build time, maintainability, testatibility, among another real world features. Besides all that, you can also have some fun analyzing the sentiment of texts publically tweeted by any searched twitter user.

<!-- Features -->
### Features

* [Search Twitter's users by username;](https://github.com/adrianodiasx93/TheFeels/issues/18)
* [Show public tweets from selected user;](https://github.com/adrianodiasx93/TheFeels/issues/22)
* [Analyze the sentiment expressed in such tweets simultaneously.](https://github.com/adrianodiasx93/TheFeels/issues/37)

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
