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
        navigationController?.asTranslucent()
        userTweetsView.tableView.isHidden = true
    }

    private func setSubViewsVisibility(isDataSourceEmpty: Bool) {
        UIView.animate(withDuration: 0.1) {
            self.userTweetsView.imgEmpty.isHidden = !isDataSourceEmpty
            self.userTweetsView.tableView.isHidden = isDataSourceEmpty
        }
    }
}

// MARK: Binding
extension UserTweetsViewController {

    private func selectionInput() -> Driver<Int> {
        userTweetsView.tableView.rx
            .itemSelected
            .map({ $0.row })
            .asDriver(onErrorDriveWith: .empty())
    }

    private func viewDidLoadInput() -> Driver<Void> {
        .just(())
    }

    private func viewModelInput() -> UserTweetsViewModeling.Input {
        UserTweetsViewModelInput(viewDidLoad: viewDidLoadInput(), selection: selectionInput())
    }

    private func bind() {
        userTweetsView.tableView.rx
            .setDelegate(self)
            .disposed(by: bag)
        let output = viewModel.transform(input: viewModelInput())
        output.didSucceed
            .do(onNext: { self.setSubViewsVisibility(isDataSourceEmpty: $0.isEmpty) })
            .map { [TweetsSection(header: "", items: $0)] }
            .drive(userTweetsView.tableView.rx.items(dataSource: tableDataSource))
            .disposed(by: bag)
        output.didNavigate
            .drive()
            .disposed(by: bag)
    }
}

// MARK: UserTweetsViewDelegate
extension UserTweetsViewController: UserTweetsViewDelegate {

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }

    public func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        view.safeAreaInsets.bottom
    }

    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }

    public func tableView(_ tableView: UITableView,
                          didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TweetCell else {
            return
        }
        cell.cancelProfileImageRequest()
    }
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
            cell.bind(viewModel: viewModel)
            return cell
        }
    }
}
