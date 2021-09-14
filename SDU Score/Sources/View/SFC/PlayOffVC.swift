//
//  PlayOffVC.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/22/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class PlayOffVC: UIViewController {
    
    var sfcPlayoff: [Playoff] = []
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        makePlayoff()
    }
    
    //MARK: - UI Components
    private lazy var myTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
        
        $0.registerCell(PlayoffCell.self)
        $0.registerCell(FinalCell.self)
    }
}

//MARK: - Methods
extension PlayOffVC {
    func makePlayoff() {
        db.collection("SFC").getDocuments() { (querySnapshot, err) in
            if let err = err {
            print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let data = document.data() as? [String: Any] {
                        let firstLabel = data["firstLabel"] as? String
                        let middleLabel = data["middleLabel"] as? String
                        let middleSecondLabel = data["middleSecondLabel"] as? String
                        let secondLabel = data["secondLabel"] as? String
                        self.sfcPlayoff.append(Playoff.init(firstLabel: firstLabel!, firstImage: UIImage.init(named: firstLabel!)!, middleLabel: middleLabel!, middleSecondLabel: middleSecondLabel!, secondImage: UIImage.init(named: secondLabel!)!, secondLabel: secondLabel!))
                    }
                    DispatchQueue.main.async {
                        self.myTableView.reloadData()
                    }
                }
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension PlayOffVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sfcPlayoff.count - 3
        } else if section == 1 {
            return sfcPlayoff.count - 5
        } else {
            return sfcPlayoff.count - 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 || indexPath.section == 1 {
            let cell = tableView.dequeueCell(PlayoffCell.self, for: indexPath)
            cell.firstImage.image = sfcPlayoff[indexPath.section * 4 + indexPath.row].firstImage
            cell.secondImage.image = sfcPlayoff[indexPath.section * 4 + indexPath.row].secondImage
            cell.firstLabel.text = sfcPlayoff[indexPath.section * 4 + indexPath.row].firstLabel
            cell.middleLabel.text = sfcPlayoff[indexPath.section * 4 + indexPath.row].middleLabel
            cell.middleSecondLabel.text = sfcPlayoff[indexPath.section * 4 + indexPath.row].middleSecondLabel
            cell.secondLabel.text = sfcPlayoff[indexPath.section * 4 + indexPath.row].secondLabel
            
            if indexPath.section == 0 && indexPath.row == 3 || indexPath.section == 1 && indexPath.row == 1 {
                cell.lineHide = true
            } else {
                cell.lineHide = false
            }
            
            return cell
        } else {
            let cell = tableView.dequeueCell(FinalCell.self, for: indexPath)
            cell.firstImage.image = sfcPlayoff[indexPath.row + 6].firstImage
            cell.secondImage.image = sfcPlayoff[indexPath.row + 6].secondImage
            cell.firstLabel.text = sfcPlayoff[indexPath.row + 6].firstLabel
            cell.middleLabel.text = sfcPlayoff[indexPath.row + 6].middleLabel
            cell.secondLabel.text = sfcPlayoff[indexPath.row + 6].secondLabel

            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension PlayOffVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        if section == 0 {
            headerView.titleLabel.text = "Round 1/4"
        } else if section == 1 {
            headerView.titleLabel.text = "Semi-final"
        } else {
            headerView.titleLabel.text = "Final"
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

//MARK: - ConfigUI
extension PlayOffVC {
    private func setupViews() {
        view.addSubview(myTableView)
        self.navigationController?.navigationBar.tintColor = .white
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        myTableView.snp.makeConstraints { (m) in
            m.top.equalTo(view.safeAreaLayoutGuide)
            m.left.right.equalTo(view).offset(0)
            m.bottom.equalTo(view).offset(0)
        }
    }
}
