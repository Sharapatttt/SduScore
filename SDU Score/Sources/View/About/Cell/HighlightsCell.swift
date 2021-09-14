//
//  HighlightsCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/17/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import SnapKit
import Then

class HighlightsCell: UITableViewCell {

    var clubs = Clubs()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Components
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
    
    private lazy var highlightsView = TitleLineView().then {
        $0.titleLabel.text = "Highlights"
        $0.titleLabel.font = .boldSystemFont(ofSize: 19)
    }
}

//MARK: - UICollectionViewDataSource
extension HighlightsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clubs.highlights.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(CollectionViewCell.self, indexPath: indexPath)
        cell.imageName = clubs.highlights[indexPath.row]
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension HighlightsCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HighlightsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 70, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}

//MARK: - ConfigUI
extension HighlightsCell {
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        [firstCollectionView, highlightsView].forEach {
            addSubview($0)
        }

        makeConstraints()
    }
    
    private func makeConstraints() {
        highlightsView.snp.makeConstraints { (m) in
            m.top.equalToSuperview()
            m.left.right.equalToSuperview()
        }
        
        firstCollectionView.snp.makeConstraints { (m) in
            m.top.equalTo(highlightsView.snp.bottom).offset(16)
            m.left.right.equalToSuperview()
            m.height.equalTo(225)
            m.bottom.equalToSuperview().offset(-16)
        }
    }
}
