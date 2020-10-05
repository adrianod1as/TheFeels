//
//  UsersSearchView.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import UIKit
import RxCocoa
import Common
import Lottie

protocol UsersSearchViewDelegate: UITableViewDelegate {

}

public class UsersSearchView: UIView {

    public lazy var imgEmpty: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = Asset.userSearch.image.withRenderingMode(.alwaysTemplate)
        imgView.tintColor = ColorName.twitterBlue
        return imgView
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: 16))
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorInset = .zero
        tableView.separatorColor = ColorName.twitterDarkGray
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.backgroundColor = .black
        return tableView
    }()

    lazy var loadingView: AnimationView = {
        let filepath = Bundle(for: UsersSearchView.self)
                        .path(forResource: L10n.Animation.Filename.profiles,
                              ofType: Common.L10n.File.Formart.json) ?? String()
        let view = AnimationView(filePath: filepath)
        view.loopMode = .loop
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    weak var delegate: UsersSearchViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func addSubviews() {
        addSubview(imgEmpty)
        insertSubview(loadingView, aboveSubview: imgEmpty)
        insertSubview(tableView, aboveSubview: loadingView)
    }

    private func activateTableViewViewConstraints() {
        tableView.leftSafeAnchor.constraint(equalTo: self.leftSafeAnchor).isActive = true
        tableView.rightSafeAnchor.constraint(equalTo: self.rightSafeAnchor).isActive = true
        tableView.topSafeAnchor.constraint(equalTo: self.topSafeAnchor).isActive = true
        tableView.bottomSafeAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    private func activateImgEmptyConstraints() {
        imgEmpty.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgEmpty.centerXAnchor.constraint(equalTo: centerXAnchor,
                                          constant: -UIScreen.width * 0.05).isActive = true
        imgEmpty.widthAnchor.constraint(equalToConstant: UIScreen.minLenght * 0.5).isActive = true
        imgEmpty.heightAnchor.constraint(equalTo: imgEmpty.widthAnchor).isActive = true
    }

    private func activateLoadingViewContraints() {
        loadingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        loadingView.topSafeAnchor.constraint(equalTo: topSafeAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: imgEmpty.topAnchor,
                                            constant: UIScreen.minLenght * 0.25).isActive = true
    }

    private func setupView() {
        backgroundColor = .black
        addSubviews()
        activateImgEmptyConstraints()
        activateTableViewViewConstraints()
        activateLoadingViewContraints()
    }

    func setAnimation(isLoading: Bool) {
        imgEmpty.alpha = isLoading ? 0 : 1
        if isLoading, !loadingView.isAnimationPlaying {
            loadingView.play(completion: nil)
        } else if !isLoading {
            loadingView.stop()
        }
    }
}
