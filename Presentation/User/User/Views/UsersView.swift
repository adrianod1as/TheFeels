//
//  UsersView.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import UIKit
import Common

protocol UsersViewDelegate: AnyObject {

}

public class UsersView: UIView {

    weak var delegate: UsersViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func activateCollectionViewConstraints() {
    }

    private func setupView() {
    }
}
