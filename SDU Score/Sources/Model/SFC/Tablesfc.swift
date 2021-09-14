//
//  Tablesfc.swift
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

class Tablesfc {
    var numberLabel: String?
    var clubImage: UIImage?
    var clubLabel: String?
    var gameLabel: String?
    var goalLabel: String?
    var pointLabel: String?
    
    init(numberLabel: String, clubImage: UIImage, clubLabel: String, gameLabel: String, goalLabel: String, pointLabel: String) {
        self.numberLabel = numberLabel
        self.clubImage = clubImage
        self.clubLabel = clubLabel
        self.gameLabel = gameLabel
        self.goalLabel = goalLabel
        self.pointLabel = pointLabel
    }
    
    init(snapshot: DataSnapshot) {
        if let value = snapshot.value as? [String: Any] {
            numberLabel = value["numberLabel"] as? String
            clubLabel = value["clubLabel"] as? String
            gameLabel = value["gameLabel"] as? String
            goalLabel = value["goalLabel"] as? String
            pointLabel = value["pointLabel"] as? String
        }
    }
}
