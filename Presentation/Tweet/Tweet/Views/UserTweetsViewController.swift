//
//  UserTweetsViewController.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import UIKit
import SwiftMessages
import Common
import RxSwift
import RxCocoa
import RxDataSources

public class UserTweetsViewController: UIViewController, UDTAnimatorViewable {

    // MARK: Properties
    private lazy var userTweetsView = UserTweetsView()
    private let bag = DisposeBag()
    private let viewModel: UserTweetsViewModeling

    // MARK: Init
    public init(viewModel: UserTweetsViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        view = userTweetsView
        userTweetsView.delegate = self
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bind()
    }
}

// MARK: UI
extension UserTweetsViewController {

    private func setupUI() {

    }

}

// MARK: Binding
extension UserTweetsViewController {

    private func bind() {
    }
}

// MARK: UserTweetsViewDelegate
extension UserTweetsViewController: UserTweetsViewDelegate {

}

// MARK: RxTableViewable
extension UserTweetsViewController: RxTableViewable {

    public var cellConfiguration: (TableViewSectionedDataSource<TweetsSection>,
                            UITableView, IndexPath, TweetViewModel) -> TweetCell {
        return { _, tableView, indexPath, viewModel in
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: TweetCell.identifier,
                                     for: indexPath) as? TweetCell else {
                return TweetCell()
            }
            return cell
        }
    }
}
