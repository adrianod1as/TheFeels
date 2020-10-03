//
//  TweetCell.swift
//  User
//
//  Created by Adriano Dias on 30/09/20.
//

import UIKit
import Common

public class TweetCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func prepareForReuse() {
        super.prepareForReuse()

    }

    private func addSubviews() {

    }

    private func setupViews() {
        contentView.backgroundColor = .black
        addSubviews()
    }
}
