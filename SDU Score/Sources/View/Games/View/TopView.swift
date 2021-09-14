//
//  TopView.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/5/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class TopView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    var gkButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "gk1")
    }
    
    var rightCbButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_a1")
    }
    
    var leftCbButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_a1")
    }

    var mdButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_a1")
    }

    var rightStButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_a1")
    }

    var leftStButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_a1")
    }
    
    var gkLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Kuanysh"
    }
    
    var rightCbLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Agmanov"
    }
    
    var leftCbLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Sagyngaly"
    }

    var mdLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Imangazin"
    }

    var rightStLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Makhmutov"
    }

    var leftStLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Kupesov"
    }
}

//MARK: - ConfigUI
extension TopView {
    private func setupViews() {
        backgroundColor = .clear
        [gkButton, rightCbButton, leftCbButton, mdButton, rightStButton, leftStButton, gkLabel, rightCbLabel, leftCbLabel, mdLabel, rightStLabel, leftStLabel].forEach {
            addSubview($0)
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        gkButton.snp.makeConstraints { (m) in
            m.top.equalTo(20)
            m.centerX.equalToSuperview()
            m.size.equalTo(40)
        }
        
        rightCbButton.snp.makeConstraints { (m) in
            m.top.equalTo(gkButton.snp.bottom).offset(15)
            m.left.equalTo(80)
            m.size.equalTo(40)
        }
        
        leftCbButton.snp.makeConstraints { (m) in
            m.top.equalTo(gkButton.snp.bottom).offset(15)
            m.right.equalTo(-80)
            m.size.equalTo(40)
        }
        
        mdButton.snp.makeConstraints { (m) in
            m.top.equalTo(rightCbButton.snp.bottom).offset(15)
            m.centerX.equalToSuperview()
            m.size.equalTo(40)
        }
        
        rightStButton.snp.makeConstraints { (m) in
            m.top.equalTo(mdButton.snp.bottom).offset(18)
            m.left.equalTo(80)
            m.size.equalTo(40)
        }
        
        leftStButton.snp.makeConstraints { (m) in
            m.top.equalTo(mdButton.snp.bottom).offset(18)
            m.right.equalTo(-80)
            m.size.equalTo(40)
        }
        
        gkLabel.snp.makeConstraints { (m) in
            m.top.equalTo(gkButton.snp.bottom)
            m.centerX.equalToSuperview()
        }
        
        rightCbLabel.snp.makeConstraints { (m) in
            m.top.equalTo(rightCbButton.snp.bottom)
            m.centerX.equalTo(rightCbButton)
        }
        
        leftCbLabel.snp.makeConstraints { (m) in
            m.top.equalTo(leftCbButton.snp.bottom)
            m.centerX.equalTo(leftCbButton)
        }
        
        mdLabel.snp.makeConstraints { (m) in
            m.top.equalTo(mdButton.snp.bottom)
            m.centerX.equalToSuperview()
        }
        
        rightStLabel.snp.makeConstraints { (m) in
            m.top.equalTo(rightStButton.snp.bottom)
            m.centerX.equalTo(rightStButton)
        }
        
        leftStLabel.snp.makeConstraints { (m) in
            m.top.equalTo(leftStButton.snp.bottom)
            m.centerX.equalTo(leftStButton)
        }
    }
}
