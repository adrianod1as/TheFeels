//
//  SearchTweetsByUsernameUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 03/10/20.
//

import RxSwift

public protocol SearchTweetsByUsernameUseCaseable: AnyObject {

    func execute(_ name: String) -> Observable<[Tweet]>
}
