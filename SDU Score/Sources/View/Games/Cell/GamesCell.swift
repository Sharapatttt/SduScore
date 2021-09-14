//
//  GamesCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/21/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import SnapKit
import Then

class GamesCell: UITableViewCell {
    
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
    var firstImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    var secondImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    var firstLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.numberOfLines = 0
        $0.textColor = UIColor(hexString: "#2C435B")
    }
    
    var secondLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .right
        $0.numberOfLines = 0
        $0.textColor = UIColor(hexString: "#2C435B")
    }
    
    var middleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.textAlignment = .center
    }
    
    private var lineView = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#2C435B")
    }
}

//MARK: - ConfigUI
extension GamesCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        [firstLabel, firstImage, middleLabel, secondImage, secondLabel, lineView].forEach {
            addSubview($0)
        }

        makeConstraints()    
    }
    
    private func makeConstraints() {
        firstLabel.snp.makeConstraints { (m) in
            m.left.equalToSuperview().offset(10)
            m.right.equalTo(firstImage.snp.left).offset(-5)
            m.centerY.equalToSuperview()
            m.height.equalTo(70)
        }

        firstImage.snp.makeConstraints { (m) in
            m.right.equalTo(middleLabel.snp.left).offset(-10)
            m.centerY.equalToSuperview()
            m.width.equalTo(70)
            m.height.equalTo(70)
        }
        
        middleLabel.snp.makeConstraints { (m) in
            m.center.equalToSuperview()
            m.width.equalTo(40)
            m.height.equalTo(70)
        }
        
        secondImage.snp.makeConstraints { (m) in
            m.left.equalTo(middleLabel.snp.right).offset(10)
            m.centerY.equalToSuperview()
            m.width.equalTo(70)
            m.height.equalTo(70)
        }
        
        secondLabel.snp.makeConstraints { (m) in
            m.left.equalTo(secondImage.snp.right).offset(5)
            m.right.equalToSuperview().offset(-10)
            m.centerY.equalToSuperview()
            m.height.equalTo(70)
        }
        
        lineView.snp.makeConstraints { (m) in
            m.height.equalTo(1)
            m.left.equalTo(10)
            m.right.equalTo(-10)
            m.bottom.equalTo(0)
        }
    }
}
