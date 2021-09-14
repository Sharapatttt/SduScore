//
//  Assist.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/18/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class Assist {
    var numberLabel: String?
    var clubImage: UIImage?
    var nameLabel: String?
    var goal_assistLabel: String?
    var clubName: String?
    
    init(numberLabel: String, clubImage: UIImage, nameLabel: String, goal_assistLabel: String) {
        self.numberLabel = numberLabel
        self.clubImage = clubImage
        self.nameLabel = nameLabel
        self.goal_assistLabel = goal_assistLabel
    }
    
    init(snapshot: DataSnapshot) {
        if let value = snapshot.value as? [String: Any] {
            numberLabel = value["numberLabel"] as? String
            nameLabel = value["nameLabel"] as? String
            goal_assistLabel = value["goal_assistLabel"] as? String
            clubName = value["clubName"] as? String
        }
    }
}
