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

    public lazy var lblMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = FontFamily.Rubik.regular.font(size: 16)
        label.numberOfLines = 0
        return label
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
        addSubview(lblMessage)
    }

    private func activateProfileViewConstraints() {
        profileView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        profileView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        profileView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func activateLblMessageConstraints() {
        lblMessage.leftAnchor.constraint(equalTo: profileView.lblTitle.leftAnchor).isActive = true
        lblMessage.rightAnchor.constraint(equalTo: profileView.lblTitle.rightAnchor).isActive = true
        lblMessage.topAnchor.constraint(equalTo: profileView.bottomAnchor).isActive = true
        lblMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }

    private func setupViews() {
        selectionStyle = .blue
        backgroundColor = .black
        addSubviews()
        activateProfileViewConstraints()
        activateLblMessageConstraints()
    }

    func bind(viewModel: TweetViewModel) {
        profileView.lblUsername.text = viewModel.subTitle
        profileView.lblTitle.text = viewModel.userViewModel.name
        profileView.imgAvatar.image = viewModel.avatar
        profileView.setProfileImage(url: viewModel.photoUrl)
        lblMessage.text = viewModel.text
    }

    func cancelProfileImageRequest() {
        profileView.cancelProfileImageRequest()
    }
}
