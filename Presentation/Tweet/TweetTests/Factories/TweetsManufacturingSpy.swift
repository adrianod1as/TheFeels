//
//  TweetsManufacturingSpy.swift
//  TweetTests
//
//  Created by Adriano Dias on 04/10/20.
//

@testable import Tweet
@testable import Domain

class TweetsManufacturingSpy: TweetsManufacturing {

    var makeUserTweetsViewControllerCalled = false

    func makeUserTweetsViewController(user: User?) -> UserTweetsViewController {
        makeUserTweetsViewControllerCalled.toggle()
        let viewModel = UserTweetsViewModel(useCase: SearchTweetsByUsernameUseCaseSpy(),
                                            analysisCase: AnalyzeSentimentForTextUseCaseableSpy(),
                                            coordinator: UserTweetsSceneCoordinatingSpy())
        viewModel.user = user
        return UserTweetsViewController(viewModel: viewModel)
    }

}
