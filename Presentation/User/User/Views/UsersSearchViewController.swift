//
//  UsersSearchViewController.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import UIKit
import SwiftMessages
import Common
import RxSwift
import RxCocoa

public class UsersSearchViewController: UIViewController, UDTAnimatorViewable {

    // MARK: Properties
    private lazy var usersSearchView = UsersSearchView()
    private let bag = DisposeBag()
    private let viewModel: UsersSearchViewModeling
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = .clear
        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.isTranslucent = true
        return searchController
    }()

    // MARK: Init
    public init(viewModel: UsersSearchViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        view = usersSearchView
        usersSearchView.delegate = self
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bind()
    }

    public override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()

        setTableFooter()
    }
}

// MARK: UI
extension UsersSearchViewController {

    private func setupUI() {
        usersSearchView.tableView.isHidden = true
        navigationController?.asTranslucent()
        navigationItem.searchController = searchController
    }

    private func setSubViewsVisibility(isDataSourceEmpty: Bool) {
        usersSearchView.imgEmpty.isHidden = !isDataSourceEmpty
        usersSearchView.tableView.isHidden = isDataSourceEmpty
    }

    private func setTableFooter() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.width,
                                          height: view.safeAreaInsets.bottom))
        footer.backgroundColor = .black
        usersSearchView.tableView.tableFooterView = footer
    }

}

// MARK: Binding
extension UsersSearchViewController {

    private func bind() {
        usersSearchView.tableView.rx
            .setDelegate(self)
            .disposed(by: bag)
        let output = viewModel.transform(input: viewModelInput())
        output.didSucceed
            .do(onNext: { self.setSubViewsVisibility(isDataSourceEmpty: $0.isEmpty) })
            .drive(usersSearchView.tableView.rx
                    .items(cellIdentifier: UserCell.identifier, cellType: UserCell.self)) { _, element, cell in
                        cell.bind(viewModel: element)
            }.disposed(by: bag)
    }

    private func selectionInput() -> Driver<Int> {
        .empty()
    }

    private func nameInput() -> Driver<String> {
        Observable.combineLatest(
            searchController.searchBar.rx.text,
            searchController.searchBar.rx.textDidEndEditing.startWith(()),
            searchController.rx.didDismiss.startWith(())
        ).map({ _ in self.searchController.searchBar.text ?? String() })
        .do(onNext: {
            if $0.isEmpty {
                self.setSubViewsVisibility(isDataSourceEmpty: $0.isEmpty)
            }
        }).asDriver(onErrorJustReturn: String())
    }

    private func viewModelInput() -> UsersSearchViewModeling.Input {
        UsersSearchViewModelInput(name: nameInput(), selection: selectionInput())
    }
}

// MARK: UsersSearchViewDelegate
extension UsersSearchViewController: UsersSearchViewDelegate {

    var bottomPadding: CGFloat {
        view.safeAreaInsets.bottom
    }

    public func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    public func tableView(_ tableView: UITableView,
                          didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? UserCell else {
            return
        }
        cell.cancelProfileImageRequest()
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchController.searchBar.endEditing(true)
    }
}
