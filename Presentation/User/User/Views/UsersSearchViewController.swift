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
import RxDataSources

public class UsersSearchViewController: UIViewController, UDTAnimatorViewable {

    // MARK: Properties
    private lazy var usersSearchView = UsersSearchView()
    private let bag = DisposeBag()
    private let viewModel: UsersSearchViewModeling
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.setTFStyle()
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
}

// MARK: UI
extension UsersSearchViewController {

    private func setupUI() {
        title = L10n.UsersSearchViewController.title
        usersSearchView.tableView.isHidden = true
        navigationController?.asTranslucent()
        navigationItem.searchController = searchController
    }

    private func setSubViewsVisibility(isDataSourceEmpty: Bool) {
        UIView.animate(withDuration: 0.1) {
            self.usersSearchView.imgEmpty.isHidden = !isDataSourceEmpty
            self.usersSearchView.tableView.isHidden = isDataSourceEmpty
        }
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
            .map { [UsersSection(header: "", items: $0)] }
            .drive(usersSearchView.tableView.rx.items(dataSource: tableDataSource))
            .disposed(by: bag)
        output.didNavigate
            .drive()
            .disposed(by: bag)
    }

    private func selectionInput() -> Driver<Int> {
        usersSearchView.tableView.rx
            .itemSelected
            .map({ $0.row })
            .do(onNext: { debugPrint($0) })
            .asDriver(onErrorDriveWith: .empty())
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
        guard let cell = cell as? UserCell else {
            return
        }
        cell.cancelProfileImageRequest()
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchController.searchBar.endEditing(true)
    }
}

extension UsersSearchViewController: RxTableViewable {

    public var cellConfiguration: (TableViewSectionedDataSource<UsersSection>,
                            UITableView, IndexPath, UserViewModel) -> UserCell {
        return { _, tableView, indexPath, viewModel in
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: UserCell.identifier,
                                     for: indexPath) as? UserCell else {
                return UserCell()
            }
            cell.bind(viewModel: viewModel)
            return cell
        }
    }
}
