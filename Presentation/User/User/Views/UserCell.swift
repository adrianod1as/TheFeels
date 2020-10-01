//
//  UserCell.swift
//  User
//
//  Created by Adriano Dias on 30/09/20.
//

import UIKit
import Common

class UserCell: UITableViewCell {

    internal lazy var profileView: ProfileView = {
        let view = ProfileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        profileView.imgAvatar.image = Asset.twitter.image.withRenderingMode(.alwaysOriginal)
    }

    private func addSubviews() {
        addSubview(profileView)
    }

    private func activateProfileViewConstraints() {
        profileView.fill(self)
    }

    private func setupViews() {
        addSubviews()
        activateProfileViewConstraints()
    }

    func bind(viewModel: UserViewModel) {
        profileView.bind(viewModel: viewModel)
    }

    func cancelProfileImageRequest() {
        profileView.cancelProfileImageRequest()
    }
}
