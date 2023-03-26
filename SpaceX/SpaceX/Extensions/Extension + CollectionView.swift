//
//  Extension + CollectionView.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 22.03.2023.
//

import UIKit

extension UICollectionView {
    func measuresSectionLayout() -> NSCollectionLayoutSection? {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets = NSDirectionalEdgeInsets(top: 6,
                                                     leading: 6,
                                                     bottom: 6,
                                                     trailing: 6)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(120),
                                               heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        //        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
        //                                                      leading: 4,
        //                                                      bottom: 8,
        //                                                      trailing: 4)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
