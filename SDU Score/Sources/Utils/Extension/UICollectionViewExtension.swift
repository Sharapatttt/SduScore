//
//  UICollectionViewExtension.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/17/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ cellClass: T.Type) {
        let cellId = String(describing: cellClass.self)
        register(cellClass.self, forCellWithReuseIdentifier: cellId)
    }
    
    func dequeueCell<T>(_ cellClass: T.Type, indexPath path: IndexPath) -> T {
        let cellId = String(describing: T.self)
        return self.dequeueReusableCell(withReuseIdentifier: cellId, for: path) as! T
    }
}

