//
//  UsersViewController.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import UIKit
import SwiftMessages
import Common
import RxSwift
import RxCocoa

public class UsersViewController: UIViewController, UDTAnimatorViewable {

    // MARK: Properties
    private lazy var usersView = UsersView()
    private let bag = DisposeBag()
    private let viewModel: UsersViewModeling

    // MARK: Init
    public init(viewModel: UsersViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        view = usersView
        usersView.delegate = self
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bind()
    }
}

// MARK: UI
extension UsersViewController {

    func setupUI() {
    }
}

// MARK: Binding
extension UsersViewController {

    func bind() {
        usersView.tableView.rx
            .setDelegate(self)
            .disposed(by: bag)
        let output = viewModel.transform(input: UsersViewModelInput(name: .just("AdrianoDias93"), selection: .just(0)))
        output.didSucceed
            .drive(usersView.tableView.rx
                    .items(cellIdentifier: UITableViewCell.identifier,
                           cellType: UITableViewCell.self)) { _, element, cell in
                                cell.textLabel?.text = element.name
            }.disposed(by: bag)
    }
}

// MARK: UsersViewDelegate
extension UsersViewController: UsersViewDelegate {

}
