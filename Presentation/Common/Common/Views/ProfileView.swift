//
//  ProfileView.swift
//  Common
//
//  Created by Adriano Dias on 01/10/20.
//

import UIKit
import Kingfisher

public class ProfileView: UIView {

    public lazy var imgAvatar: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = Asset.twitter.image.withRenderingMode(.alwaysOriginal)
        return imgView
    }()

    public lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = FontFamily.RubikMedium.regular.font(size: 16)
        return label
    }()

    public lazy var lblUsername: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = ColorName.twitterLightGray
        label.font = FontFamily.Rubik.regular.font(size: 16)
        return label
    }()

    public lazy var stkUser: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [lblTitle, lblUsername])
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupViews()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        imgAvatar.layer.cornerRadius = imgAvatar.frame.width / 2
    }

    private func addSubviews() {
        addSubview(imgAvatar)
        addSubview(stkUser)
    }

    private func activateImgAvatarConstraints() {
        imgAvatar.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        imgAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        imgAvatar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        imgAvatar.widthAnchor.constraint(equalTo: imgAvatar.heightAnchor).isActive = true
    }

    private func activateStkUserConstraints() {
        stkUser.leftAnchor.constraint(equalTo: imgAvatar.rightAnchor, constant: 8).isActive = true
        stkUser.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        stkUser.centerYAnchor.constraint(equalTo: imgAvatar.centerYAnchor).isActive = true
        stkUser.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private func setupViews() {
        addSubviews()
        activateImgAvatarConstraints()
        activateStkUserConstraints()
    }

    public func setProfileImage(url: URL?) {
        if let url = url {
            imgAvatar.kf.setImage(with: url)
        }
    }

    public func cancelProfileImageRequest() {
        imgAvatar.kf.cancelDownloadTask()
    }
}
