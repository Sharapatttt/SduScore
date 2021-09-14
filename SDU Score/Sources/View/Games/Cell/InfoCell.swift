//
//  InfoCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/4/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
//    var title: String? {
//        didSet {
//            guard let title = title else { return }
//        }
//    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    var infoFirstImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "ball1")
    }

    var infoFirstLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.numberOfLines = 0
        $0.textColor = UIColor(hexString: "#2C435B")
    }
    
    var infoSecondImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "ball1")
    }

    var infoSecondLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.numberOfLines = 0
        $0.textColor = UIColor(hexString: "#2C435B")
    }
}

//MARK: - ConfigUI
extension InfoCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        [infoFirstImage, infoFirstLabel, infoSecondImage, infoSecondLabel].forEach {
            addSubview($0)
        }

        makeConstraints()
    }
    
    private func makeConstraints() {
        infoFirstImage.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(10)
            m.size.equalTo(16)
        }
        
        infoFirstLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(infoFirstImage.snp.right).offset(4)
        }
        
        infoSecondLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.right.equalTo(infoSecondImage.snp.left).offset(-4)
        }
        
        infoSecondImage.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.right.equalTo(-10)
            m.size.equalTo(16)
        }
    }
}

