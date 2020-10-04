//
//  TweetViewModel.swift
//  Tweet
//
//  Created by Adriano Dias on 03/10/20.
//

import Domain
import RxDataSources
import Common

public struct TweetViewModel: IdentifiableType, Equatable {

    public let tweet: Tweet

    public var userViewModel: UserViewModel {
        tweet.user.asViewModel
    }

    public var date: String {
        tweet.createdAt.asTwitterDate?.with(formart: Domain.L10n.Brazil.Date.format) ?? String()
    }

    public var subTitle: String {
        "\(userViewModel.username) - \(date)"
    }

    public var text: String {
        tweet.text
    }

    public var identity: String {
        tweet.id.description
    }
}

public extension Tweet {

    var asViewModel: TweetViewModel {
        TweetViewModel(tweet: self)
    }
}

public extension Array where Element == Tweet {

    var asViewModels: [TweetViewModel] {
        map({ $0.asViewModel })
    }
}

public struct TweetsSection {

    public var header: String
    public var items: [Item]

    public init(header: String, items: [Item]) {
        self.header = header
        self.items = items
    }
}

extension TweetsSection: AnimatableSectionModelType {

    public typealias Item = TweetViewModel

    public var identity: String {
        return header
    }

    public init(original: TweetsSection, items: [Item]) {
        self = original
        self.items = items
    }
}
