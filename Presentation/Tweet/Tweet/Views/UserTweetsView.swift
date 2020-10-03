//
//  UserTweetsView.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import UIKit
import RxCocoa
import Common

protocol UserTweetsViewDelegate: UITableViewDelegate {

}

public class UserTweetsView: UIView {

    weak var delegate: UserTweetsViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func addSubviews() {

    }

    private func setupView() {
        backgroundColor = .black
        addSubviews()
    }
}
