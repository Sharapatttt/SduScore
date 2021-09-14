//
//  SflCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/21/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import SnapKit
import Then

class SflCell: UITableViewCell {

    var lineHide: Bool = false {
        didSet {
            lineView.isHidden = lineHide
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    var numberLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    
    var clubImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    var clubLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 17)
        $0.textColor = UIColor(hexString: "#2C435B")
    }
    
    var gameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.textAlignment = .center
    }

    var goalLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.textAlignment = .center
    }

    var pointLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 17)
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.textAlignment = .center
    }

    private var lineView = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#2C435B")
    }
}

//MARK: - ConfigUI
extension SflCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        [numberLabel, clubImage, clubLabel, gameLabel, goalLabel, pointLabel, lineView].forEach {
            addSubview($0)
        }

        makeConstraints()
    }
    
    private func makeConstraints() {
        numberLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(10)
            m.width.equalTo(30)
            m.height.equalTo(30)
        }
        
        clubImage.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(numberLabel.snp.right).offset(5)
            m.width.equalTo(40)
            m.height.equalTo(40)
        }
        
        clubLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(clubImage.snp.right).offset(10)
            m.height.equalTo(40)
        }
        
        gameLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(clubLabel.snp.right).offset(20)
            m.height.equalTo(40)
            m.width.equalTo(40)
        }
        
        goalLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(gameLabel.snp.right).offset(15)
            m.height.equalTo(40)
            m.width.equalTo(50)
        }
        
        pointLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(goalLabel.snp.right).offset(15)
            m.right.equalTo(-10)
            m.height.equalTo(40)
            m.width.equalTo(40)
        }
        
        lineView.snp.makeConstraints { (m) in
            m.height.equalTo(1)
            m.left.equalTo(0)
            m.right.equalTo(0)
            m.bottom.equalTo(0)
        }
    }
}
