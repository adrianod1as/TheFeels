//
//  TweetViewModel.swift
//  Tweet
//
//  Created by Adriano Dias on 03/10/20.
//

import Domain
import RxDataSources

public struct TweetViewModel: IdentifiableType, Equatable {

    public var identity: String {
        String()
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
