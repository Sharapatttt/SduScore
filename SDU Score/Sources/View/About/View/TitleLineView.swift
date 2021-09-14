//
//  TitleLineView.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/17/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class TitleLineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private lazy var leftView1 = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#FE8078")
    }
    private lazy var leftView2 = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#2C435B")
    }
    
    lazy var titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.numberOfLines = 0
    }
    
    private lazy var rightView1 = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#FE8078")
    }
    private lazy var rightView2 = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#2C435B")
    }
}

//MARK: - ConfigUI
extension TitleLineView {
    private func setupViews() {
        backgroundColor = .clear
        [leftView1, leftView2, titleLabel, rightView1, rightView2].forEach {
            addSubview($0)
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        leftView1.snp.makeConstraints { (m) in
            m.top.equalToSuperview().offset(6)
            m.left.equalToSuperview()
            m.height.equalTo(5)
            m.right.equalTo(titleLabel.snp.left).offset(-8)
        }
        
        leftView2.snp.makeConstraints { (m) in
            m.top.equalTo(leftView1.snp.bottom)
            m.left.equalToSuperview()
            m.height.equalTo(5)
            m.right.equalTo(titleLabel.snp.left).offset(-8)
        }

        titleLabel.snp.makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.top.bottom.equalToSuperview()            
        }
        
        rightView1.snp.makeConstraints { (m) in
            m.top.equalToSuperview().offset(6)
            m.right.equalToSuperview()
            m.height.equalTo(5)
            m.left.equalTo(titleLabel.snp.right).offset(8)
        }
        
        rightView2.snp.makeConstraints { (m) in
            m.top.equalTo(rightView1.snp.bottom)
            m.right.equalToSuperview()
            m.height.equalTo(5)
            m.left.equalTo(titleLabel.snp.right).offset(8)
        }
    }
}
