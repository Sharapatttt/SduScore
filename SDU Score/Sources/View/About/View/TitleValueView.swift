//
//  TitleValueView.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/17/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class TitleValueView: UIView {
    
    var title: String? {
        didSet {
            guard let title = title else { return }
            let text = NSMutableAttributedString()
            text.append(NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#FE8078"), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),                  NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]))
            titleLabel.attributedText = text
        }
    }
    
    var desc: String? {
        didSet {
            guard let desc = desc else { return }
            descLabel.text = desc
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private lazy var titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = UIColor(hexString: "#FE8078")
    }
    
    private lazy var descLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .center
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.numberOfLines = 0
    }
}

//MARK: - ConfigUI
extension TitleValueView {
    private func setupViews() {
        backgroundColor = .clear
        [descLabel, titleLabel].forEach {
            addSubview($0)
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { (m) in
            m.top.equalToSuperview()
            m.centerX.equalToSuperview()
        }
        
        descLabel.snp.makeConstraints { (m) in
            m.top.equalTo(titleLabel.snp.bottom).offset(6)
            m.left.right.equalToSuperview().inset(50)
            m.bottom.equalToSuperview()
        }
    }
}
