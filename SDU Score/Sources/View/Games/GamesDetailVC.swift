//
//  GamesDetailVC.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/1/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class GamesDetailVC: UIViewController {

    var arrA: [String]?
    var arrB: [String]?
    
    var lineA: [String]?
    var lineB: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    //MARK: - UI Components
    var firstImage = UIImageView()

    var secondImage = UIImageView()

    var firstLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.textAlignment = .center
    }
    
    var secondLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.textAlignment = .center
    }
    
    var middleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = UIColor(hexString: "#2C435B")
        $0.textAlignment = .center
    }
    
    var mySegmentControl = UISegmentedControl().then {
        $0.insertSegment(withTitle: "Info", at: 0, animated: true)
        $0.insertSegment(withTitle: "Line up", at: 1, animated: true)
        $0.insertSegment(withTitle: "Scheme", at: 2, animated: true)
        $0.tintColor = UIColor.white.withAlphaComponent(0.3)
        $0.selectedSegmentTintColor = UIColor.lightGray.withAlphaComponent(0.6)
        $0.selectedSegmentIndex = 0
        $0.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
    }
    
    private lazy var myTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
        
        $0.registerCell(InfoCell.self)
        $0.registerCell(LineupCell.self)
        $0.registerCell(SchemeCell.self)
    }
}

//MARK: - Method
extension GamesDetailVC {
    @objc func handleSegmentChange() {
        myTableView.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension GamesDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mySegmentControl.selectedSegmentIndex == 0 {
                return arrA?.count ?? 0            
        } else if mySegmentControl.selectedSegmentIndex == 1 {
            return lineA?.count ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if mySegmentControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueCell(InfoCell.self, for: indexPath)
            if arrA?[indexPath.row] == "" {
                cell.infoFirstImage.isHidden = true
            } else {
                cell.infoFirstImage.isHidden = false
            }
            if arrB?[indexPath.row] == "" {
                cell.infoSecondImage.isHidden = true
            } else {
                cell.infoSecondImage.isHidden = false
            }
            cell.infoFirstLabel.text = arrA?[indexPath.row]
            cell.infoSecondLabel.text = arrB?[indexPath.row]
            
            return cell
        } else if mySegmentControl.selectedSegmentIndex == 1 {
            let cell = tableView.dequeueCell(LineupCell.self, for: indexPath)
            cell.nameFirstLabel.text = lineA?[indexPath.row]
            cell.nameSecondLabel.text = lineB?[indexPath.row]
            
            return cell
        } else {
            let cell = tableView.dequeueCell(SchemeCell.self, for: indexPath)
            
            return cell
        }
    }
}

//MARK: - //MARK: - UITableViewDelegate
extension GamesDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if mySegmentControl.selectedSegmentIndex == 0 {
            return 36
        } else if mySegmentControl.selectedSegmentIndex == 1 {
            return 36
        } else {
            return 500
        }
    }
}

//MARK: - ConfigUI
extension GamesDetailVC {
    private func setupViews() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        [firstLabel, firstImage, middleLabel, secondImage, secondLabel, mySegmentControl, myTableView].forEach {
            view.addSubview($0)
        }
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "#FE8078")
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        firstImage.snp.makeConstraints { (m) in
            m.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            m.left.equalTo(20)
            m.width.equalTo((self.view.frame.width - 150) / 2)
            m.height.equalTo(120)
        }
        
        middleLabel.snp.makeConstraints { (m) in
            m.centerY.equalTo(firstImage.snp.centerY)
            m.left.equalTo(firstImage.snp.right).offset(20)
        }
        
        secondImage.snp.makeConstraints { (m) in
            m.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            m.left.equalTo(middleLabel.snp.right).offset(20)
            m.right.equalTo(-20)
            m.width.equalTo((self.view.frame.width - 150) / 2)
            m.height.equalTo(120)
        }
        
        firstLabel.snp.makeConstraints { (m) in
            m.top.equalTo(firstImage.snp.bottom).offset(20)
            m.left.equalTo(20)
            m.width.equalTo(firstImage)
        }
        
        secondLabel.snp.makeConstraints { (m) in
            m.top.equalTo(secondImage.snp.bottom).offset(20)
            m.right.equalTo(-20)
            m.width.equalTo(secondImage)
        }
        
        mySegmentControl.snp.makeConstraints { (m) in
            m.top.equalTo(firstLabel.snp.bottom).offset(10)
            m.left.right.equalToSuperview()
            m.height.equalTo(30)
        }
        
        myTableView.snp.makeConstraints { (m) in
            m.top.equalTo(mySegmentControl.snp.bottom).offset(0)
            m.left.right.equalToSuperview()
            m.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
