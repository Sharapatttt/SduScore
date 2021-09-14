//
//  BottomView.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/5/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class BottomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    var gkButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "gk")
    }
    
    var rightCbButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_b")
    }
    
    var leftCbButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_b")
    }

    var mdButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_b")
    }

    var rightStButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_b")
    }

    var leftStButton = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "team_b")
    }
    
    var gkLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Ordabek"
    }
    
    var rightCbLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Azamat"
    }
    
    var leftCbLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Askarov"
    }

    var mdLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Zhiembay"
    }

    var rightStLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Khametov"
    }

    var leftStLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(hexString: "#0C2239")
        $0.text = "Omirzak"
    }
}

//MARK: - ConfigUI
extension BottomView {
    private func setupViews() {
        backgroundColor = .clear
        [gkButton, rightCbButton, leftCbButton, mdButton, rightStButton, leftStButton, gkLabel, rightCbLabel, leftCbLabel, mdLabel, rightStLabel, leftStLabel].forEach {
            addSubview($0)
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        gkButton.snp.makeConstraints { (m) in
            m.bottom.equalTo(gkLabel.snp.top)
            m.centerX.equalToSuperview()
            m.size.equalTo(40)
        }
        
        rightCbButton.snp.makeConstraints { (m) in
            m.bottom.equalTo(gkButton.snp.top).offset(-15)
            m.right.equalTo(-80)
            m.size.equalTo(40)
        }
        
        leftCbButton.snp.makeConstraints { (m) in
            m.bottom.equalTo(gkButton.snp.top).offset(-15)
            m.left.equalTo(80)
            m.size.equalTo(40)
        }
        
        mdButton.snp.makeConstraints { (m) in
            m.bottom.equalTo(rightCbButton.snp.top).offset(-16)
            m.centerX.equalToSuperview()
            m.size.equalTo(40)
        }
        
        rightStButton.snp.makeConstraints { (m) in
            m.bottom.equalTo(mdButton.snp.top).offset(-18)
            m.right.equalTo(-80)
            m.size.equalTo(40)
        }
        
        leftStButton.snp.makeConstraints { (m) in
            m.bottom.equalTo(mdButton.snp.top).offset(-18)
            m.left.equalTo(80)
            m.size.equalTo(40)
        }
        
        gkLabel.snp.makeConstraints { (m) in
            m.bottom.equalTo(-20)
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
