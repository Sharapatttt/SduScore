//
//  Playoff.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/17/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class Playoff {
    var firstLabel: String?
    var firstImage: UIImage?
    var middleLabel: String?
    var middleSecondLabel: String?
    var secondImage: UIImage?
    var secondLabel: String?
    
    init(firstLabel: String, firstImage: UIImage, middleLabel: String, middleSecondLabel: String, secondImage: UIImage, secondLabel: String) {
        self.firstLabel = firstLabel
        self.firstImage = firstImage
        self.middleLabel = middleLabel
        self.middleSecondLabel = middleSecondLabel
        self.secondImage = secondImage
        self.secondLabel = secondLabel
    }
    
    init(snapshot: DataSnapshot) {
        if let value = snapshot.value as? [String: Any] {
            firstLabel = value["firstLabel"] as? String
            middleLabel = value["middleLabel"] as? String
            middleSecondLabel = value["middleSecondLabel"] as? String
            secondLabel = value["secondLabel"] as? String
        }
    }

}
