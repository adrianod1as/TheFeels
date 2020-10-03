//
//  TweetCell.swift
//  User
//
//  Created by Adriano Dias on 30/09/20.
//

import UIKit
import Common

public class TweetCell: UITableViewCell {

    private lazy var profileView: ProfileView = {
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

    public override func prepareForReuse() {
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
        selectionStyle = .none
        contentView.backgroundColor = .black
        addSubviews()
        activateProfileViewConstraints()
    }

    func bind(viewModel: TweetViewModel) {
        profileView.lblUsername.text = viewModel.userViewModel.username
        profileView.lblTitle.text = viewModel.userViewModel.name
        profileView.setProfileImage(url: viewModel.userViewModel.profileImageUrl)
    }

    func cancelProfileImageRequest() {
        profileView.cancelProfileImageRequest()
    }
}
