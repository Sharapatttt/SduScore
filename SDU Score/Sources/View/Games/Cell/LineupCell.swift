//
//  LineupCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/4/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class LineupCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    var nameFirstLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#2C435B")
    }

    var numberFirstLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#2C435B")
    }
    
    var nameSecondLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#2C435B")
    }

    var numberSecondLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#2C435B")
    }

}

//MARK: - ConfigUI
extension LineupCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        [nameFirstLabel, numberFirstLabel, nameSecondLabel, numberSecondLabel].forEach {
            addSubview($0)
        }

        makeConstraints()
    }
    
    private func makeConstraints() {
        numberFirstLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(10)
        }
        
        nameFirstLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.left.equalTo(numberFirstLabel.snp.right).offset(5)
        }
        
        nameSecondLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.right.equalTo(numberSecondLabel.snp.left).offset(-5)
        }
        
        numberSecondLabel.snp.makeConstraints { (m) in
            m.centerY.equalToSuperview()
            m.right.equalTo(-10)
        }
        
        
    }
}

