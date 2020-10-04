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

    public lazy var imgEmpty: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = Asset.twitter.image.withRenderingMode(.alwaysOriginal)
        return imgView
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.identifier)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: 16))
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorInset = .zero
        tableView.separatorColor = ColorName.twitterDarkGray
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.backgroundColor = .black
        return tableView
    }()

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
        addSubview(imgEmpty)
        insertSubview(tableView, aboveSubview: imgEmpty)
    }

    private func activateTableViewViewConstraints() {
        tableView.leftSafeAnchor.constraint(equalTo: self.leftSafeAnchor).isActive = true
        tableView.rightSafeAnchor.constraint(equalTo: self.rightSafeAnchor).isActive = true
        tableView.topSafeAnchor.constraint(equalTo: self.topSafeAnchor).isActive = true
        tableView.bottomSafeAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    private func activateImgEmptyConstraints() {
        imgEmpty.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgEmpty.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgEmpty.widthAnchor.constraint(equalToConstant: UIScreen.minLenght * 0.5).isActive = true
        imgEmpty.heightAnchor.constraint(equalTo: imgEmpty.widthAnchor).isActive = true
    }

    private func setupView() {
        backgroundColor = .black
        addSubviews()
        activateImgEmptyConstraints()
        activateTableViewViewConstraints()
    }
}
