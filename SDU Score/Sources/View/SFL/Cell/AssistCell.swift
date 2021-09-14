//
//  AssistCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/22/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import Foundation
import SnapKit
import Then

class AssistCell: UITableViewCell {

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
        $0.textColor = UIColor(hexString: "#2C435B")
    }
    
    var clubImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    var nameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#2C435B")
    }

    var goal_assistLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.textAlignment = .center
    }

    private var lineView = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#2C435B")
    }
}

//MARK: - ConfigUI
extension AssistCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        [numberLabel, clubImage, nameLabel, goal_assistLabel, lineView].forEach {
            addSubview($0)
        }

        makeConstraints()
    }
    
    private func makeConstraints() {
        numberLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(10)
            m.width.equalTo(20)
            m.height.equalTo(40)
        }
        
        clubImage.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(numberLabel.snp.right).offset(5)
            m.width.equalTo(40)
            m.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(clubImage.snp.right).offset(10)
            m.height.equalTo(40)
        }
        
        goal_assistLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.right.equalTo(-25)
            m.height.equalTo(40)
        }
        
        lineView.snp.makeConstraints { (m) in
            m.height.equalTo(1)
            m.left.equalTo(0)
            m.right.equalTo(0)
            m.bottom.equalTo(0)
        }
    }
}
