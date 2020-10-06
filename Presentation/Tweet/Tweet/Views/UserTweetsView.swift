//
//  UserTweetsView.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import UIKit
import RxCocoa
import Common
import Lottie

protocol UserTweetsViewDelegate: UITableViewDelegate {

    func refresh()
}

public class UserTweetsView: UIView {

    public lazy var lblEmpty: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = FontFamily.RubikMedium.regular.font(size: 16)
        label.numberOfLines = 0
        label.text = "Sem tweets.\nToque para atualizar."
        label.addGestureRecognizer(loadTapGesture())
        return label
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

    lazy var loadingView: AnimationView = {
        let filepath = Bundle(for: UserTweetsView.self)
                        .path(forResource: L10n.Animation.Filename.tweets,
                              ofType: Common.L10n.File.Formart.json) ?? String()
        let view = AnimationView(filePath: filepath)
        view.loopMode = .loop
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(loadTapGesture())
        return view
    }()

    func loadTapGesture() -> UITapGestureRecognizer {
        UITapGestureRecognizer(target: self, action: #selector(refresh))
    }

    @objc func refresh() {
        self.delegate?.refresh()
    }

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
        addSubview(loadingView)
        addSubview(lblEmpty)
        insertSubview(tableView, aboveSubview: loadingView)
    }

    private func activateTableViewViewConstraints() {
        tableView.leftSafeAnchor.constraint(equalTo: self.leftSafeAnchor).isActive = true
        tableView.rightSafeAnchor.constraint(equalTo: self.rightSafeAnchor).isActive = true
        tableView.topSafeAnchor.constraint(equalTo: self.topSafeAnchor).isActive = true
        tableView.bottomSafeAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    private func activateLblEmptyConstraints() {
        lblEmpty.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        lblEmpty.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        lblEmpty.topAnchor.constraint(equalTo: loadingView.bottomAnchor,
                                     constant: -UIScreen.minLenght * 0.25).isActive = true

    }

    private func activateLoadingViewContraints() {
        loadingView.centerYAnchor.constraint(equalTo: centerYAnchor,
                                             constant: UIScreen.minLenght * -0.1).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingView.widthAnchor.constraint(equalToConstant: UIScreen.minLenght).isActive = true
        loadingView.heightAnchor.constraint(equalTo: loadingView.widthAnchor).isActive = true
    }

    private func setupView() {
        backgroundColor = .black
        addSubviews()
        activateLblEmptyConstraints()
        activateTableViewViewConstraints()
        activateLoadingViewContraints()
    }

    var isLoading: Bool = false {
        didSet {
            setUserInteractionEnabled()
            if isLoading, !loadingView.isAnimationPlaying {
                loadingView.loopMode = .loop
                self.lblEmpty.alpha = 0
                loadingView.play { _ in
                    self.setUserInteractionEnabled()
                    self.lblEmpty.alpha = self.isLoading ? 0 : 1
                }
            } else if !isLoading {
                loadingView.loopMode = .playOnce
            }
        }
    }

    private func setUserInteractionEnabled() {
        loadingView.isUserInteractionEnabled = !isLoading
        lblEmpty.isUserInteractionEnabled = !isLoading
    }
}
