//
//  CollectionViewCell.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/17/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var imageName: UIImage? {
        didSet {
            guard let namedString = imageName else { return }
            imageView.image = namedString
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    private var imageView = UIImageView().then {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
}

//MARK: - ConfigUI
extension CollectionViewCell {
    private func setupViews() {
        backgroundColor = .clear
        
        [imageView].forEach {
            addSubview($0)
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
    }
}
