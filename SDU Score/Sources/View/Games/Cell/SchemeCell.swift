//
//  SchemeCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/4/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class SchemeCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private var poleImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "pitch")
    }
    
    var topView = TopView()
    
    var bottomView = BottomView()
}

//MARK: - ConfigUI
extension SchemeCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        [poleImage, topView, bottomView].forEach {
            addSubview($0)
        }

        makeConstraints()
    }
    
    private func makeConstraints() {
        poleImage.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
        
        topView.snp.makeConstraints { (m) in
            m.left.equalTo(0)
            m.top.equalTo(0)
            m.right.equalTo(0)
        }
        
        bottomView.snp.makeConstraints { (m) in
            m.left.equalTo(0)
            m.bottom.equalTo(0)
            m.right.equalTo(0)
        }
    }
}

