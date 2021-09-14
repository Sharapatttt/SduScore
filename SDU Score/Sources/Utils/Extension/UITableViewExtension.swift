//
//  UITableViewExtension.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/21/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let cellId = String(describing: cellClass.self)
        register(cellClass.self, forCellReuseIdentifier: cellId)
    }

    func dequeueCell<T>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        let cellId = String(describing: T.self)
        return self.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! T
    }
}
