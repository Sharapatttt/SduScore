//
//  AboutCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/12/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import SnapKit
import Then

class AboutCell: UITableViewCell {

    var clubs = Clubs()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
    private lazy var sduLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textAlignment = .center
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.text = "SDU Score"
    }
    
    private lazy var footballView = TitleLineView().then {
        $0.titleLabel.text = "Football resource of SDU"
    }
    
    private lazy var firstCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
                
        cv.registerCell(CollectionViewCell.self)
        cv.dataSource = self
        cv.delegate = self
    
        return cv
    }()
    
    private lazy var descView = TitleLineView().then {
        $0.titleLabel.text = "We will show you what sport \nmeans for SDU students"
    }
    
    private lazy var emotionsImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "emotions")
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private lazy var passionImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "passion")
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }

    private lazy var respectImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "respect")
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private lazy var sfcView = TitleLineView().then {
        $0.titleLabel.text = "SFC"
        $0.titleLabel.font = .boldSystemFont(ofSize: 19)
    }

    private lazy var aboutSfc = TitleValueView().then {
        $0.desc = "The Cup is held every year from autumn to the beginning of winter. It is held according to the Champions League system."
    }
    
    private lazy var quaSfc = TitleValueView().then {
        $0.title = "Qualification Stage"
        $0.desc = "Up to 16 teams can participate and 8 of them will win a ticket to the next stage."
    }

    private lazy var groupSfc = TitleValueView().then {
        $0.title = "Group Stage"
        $0.desc = "After the selection, the teams play from the first 8th league. The first 2 places come out of each group"
    }
    
    private lazy var playoffSfc = TitleValueView().then {
        $0.title = "Play-Off"
        $0.desc = "Play-off here the teams that have passed the selection will be waiting for teams from 1 to 8 places in the league."
    }
    
    private lazy var sflView = TitleLineView().then {
        $0.titleLabel.text = "SFL"
        $0.titleLabel.font = .boldSystemFont(ofSize: 19)
    }
    
    private lazy var aboutSfl = TitleValueView().then {
        $0.desc = "The league is held every spring. 14 teams participate in it. It consists of 2 stages."
    }
    
    private lazy var quaSfl = TitleValueView().then {
        $0.title = "Qualification Stage"
        $0.desc = "The first basket is the teams that played in the SFL playoffs. The rest are selected."
    }

    private lazy var leagueSfl = TitleValueView().then {
        $0.title = "League"
        $0.desc = "Each team will play against each other. If the team wins, 3 points are assigned, if there is a draw, 1 point, and if they lose, 0 points. The team with the most points wins the champion title."
    }
}

//MARK: - UICollectionViewDataSource
extension AboutCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clubs.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(CollectionViewCell.self, indexPath: indexPath)
        cell.imageName = clubs.images[indexPath.row]
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension AboutCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AboutCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 70, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}

//MARK: - ConfigUI
extension AboutCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        [sduLabel, footballView, firstCollectionView, descView, emotionsImage, passionImage, respectImage, sfcView, aboutSfc, quaSfc, groupSfc, playoffSfc, sflView, aboutSfl, quaSfl, leagueSfl].forEach {
            addSubview($0)
        }

        makeConstraints()
    }
    
    private func makeConstraints() {
        sduLabel.snp.makeConstraints { (m) in
            m.top.equalTo(16)
            m.centerX.equalToSuperview()
        }
        
        footballView.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview()
            m.top.equalTo(sduLabel.snp.bottom).offset(10)
        }
        
        firstCollectionView.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview()
            m.top.equalTo(footballView.snp.bottom).offset(16)
            m.height.equalTo(225)
        }
        
        descView.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview()
            m.top.equalTo(firstCollectionView.snp.bottom).offset(16)
        }
        
        emotionsImage.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview().inset(50)
            m.top.equalTo(descView.snp.bottom).offset(20)
            m.height.equalTo(200)
        }

        passionImage.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview().inset(50)
            m.top.equalTo(emotionsImage.snp.bottom).offset(32)
            m.height.equalTo(200)
        }

        respectImage.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview().inset(50)
            m.top.equalTo(passionImage.snp.bottom).offset(32)
            m.height.equalTo(200)
        }

        sfcView.snp.makeConstraints { (m) in
            m.left.right.equalToSuperview()
            m.top.equalTo(respectImage.snp.bottom).offset(16)
        }
        
        aboutSfc.snp.makeConstraints { (m) in
            m.top.equalTo(sfcView.snp.bottom).offset(8)
            m.left.right.equalToSuperview()            
        }
        
        quaSfc.snp.makeConstraints { (m) in
            m.top.equalTo(aboutSfc.snp.bottom).offset(16)
            m.left.right.equalToSuperview()
        }
        
        groupSfc.snp.makeConstraints { (m) in
            m.top.equalTo(quaSfc.snp.bottom).offset(16)
            m.left.right.equalToSuperview()
        }
        
        playoffSfc.snp.makeConstraints { (m) in
            m.top.equalTo(groupSfc.snp.bottom).offset(16)
            m.left.right.equalToSuperview()
        }
        
        sflView.snp.makeConstraints { (m) in
            m.top.equalTo(playoffSfc.snp.bottom).offset(16)
            m.left.right.equalToSuperview()
        }
        
        aboutSfl.snp.makeConstraints { (m) in
            m.top.equalTo(sflView.snp.bottom).offset(8)
            m.left.right.equalToSuperview()
        }
        
        quaSfl.snp.makeConstraints { (m) in
            m.top.equalTo(aboutSfl.snp.bottom).offset(16)
            m.left.right.equalToSuperview()
        }
        
        leagueSfl.snp.makeConstraints { (m) in
            m.top.equalTo(quaSfl.snp.bottom).offset(16)
            m.left.right.equalToSuperview()
            m.bottom.equalTo(-16)
        }
    }
}
