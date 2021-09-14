//
//  SfcCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/21/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import SnapKit
import Then

class SfcCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    var stageLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = UIColor(hexString: "#2C435B")
    }
    
    private var lineView = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#2C435B")
    }
}

//MARK: - ConfigUI
extension SfcCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(stageLabel)
        addSubview(lineView)

        makeConstraints()
    }
    
    private func makeConstraints() {
        stageLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(10)
            m.height.equalTo(40)
        }
        
        lineView.snp.makeConstraints { (m) in
            m.height.equalTo(1)
            m.left.equalTo(10)
            m.right.equalTo(-10)
            m.bottom.equalTo(0)
        }
    }
}
