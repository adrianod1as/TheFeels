//
//  EvaluatingView.swift
//  Tweet
//
//  Created by Adriano Dias on 05/10/20.
//

import UIKit
import Lottie
import Common

class EvaluatingView: UIView {

    lazy var animationView: AnimationView = {
        let filepath = Bundle(for: UserTweetsViewController.self)
                        .path(forResource: L10n.Animation.Filename.sentiments,
                              ofType: Common.L10n.File.Formart.json) ?? String()
        let view = AnimationView(filePath: filepath)
        view.loopMode = .loop
        view.contentMode = .scaleAspectFit
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func setupView() {
        animationView.frame = CGRect(x: 0, y: 0, width: frame.width * 1.5, height: frame.height * 1.5)
        addSubview(animationView)
        animationView.center = center
    }
}
