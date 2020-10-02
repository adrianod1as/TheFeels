//
//  RxTableViewable.swift
//  Common
//
//  Created by Adriano Dias on 01/10/20.
//

import UIKit
import RxDataSources

public extension AnimationConfiguration {

    static var fade: AnimationConfiguration {
        AnimationConfiguration(insertAnimation: .fade, reloadAnimation: .fade, deleteAnimation: .fade)
    }
}

public protocol RxTableViewable {

    associatedtype Cell: UITableViewCell
    associatedtype Section: AnimatableSectionModelType

    var cellConfiguration: (TableViewSectionedDataSource<Section>,
                            UITableView, IndexPath, Section.Item) -> Cell { get }
    var tableDataSource: RxTableViewSectionedAnimatedDataSource<Section> { get }
    var decideViewTransition: (TableViewSectionedDataSource<Section>,
                               UITableView, [Changeset<Section>]) -> ViewTransition { get }
    var animationConfiguration: AnimationConfiguration { get }
}

public extension RxTableViewable {

    var animationConfiguration: AnimationConfiguration {
        .fade
    }

    var decideViewTransition: (TableViewSectionedDataSource<Section>,
                               UITableView, [Changeset<Section>]) -> ViewTransition {
        { _, _, _ in .animated }
    }

    var tableDataSource: RxTableViewSectionedAnimatedDataSource<Section> {
        RxTableViewSectionedAnimatedDataSource<Section>(animationConfiguration: animationConfiguration,
                                                        decideViewTransition: decideViewTransition,
                                                        configureCell: cellConfiguration)
    }

}
