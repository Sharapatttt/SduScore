//
//  GroupVC.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/22/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class GroupVC: UIViewController {
    
    var sfcGroup: [Tablegroup] = []
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        makeGroup()
    }
    
    //MARK: - UI Components
    private lazy var myTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
        
        $0.registerCell(SflCell.self)
    }
}

//MARK: - Methods
extension GroupVC {
    func makeGroup() {
        db.collection("groupSfc").getDocuments() { (querySnapshot, err) in
            if let err = err {
            print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let data = document.data() as? [String: Any] {
                        let clubLabel = data["clubLabel"] as? String
                        let numberLabel = data["numberLabel"] as? String
                        let gameLabel = data["gameLabel"] as? String
                        let pointLabel = data["pointLabel"] as? String
                        let goalLabel = data["goalLabel"] as? String
                        if clubLabel != "" {
                            self.sfcGroup.append(Tablegroup(numberLabel: numberLabel!, clubImage: UIImage(named: clubLabel!)!, clubLabel: clubLabel!, gameLabel: gameLabel!, goalLabel: goalLabel!, pointLabel: pointLabel!))
                        } else {
                            self.sfcGroup.append(Tablegroup(numberLabel: numberLabel!, clubImage: UIImage.init(), clubLabel: clubLabel!, gameLabel: gameLabel!, goalLabel: goalLabel!, pointLabel: pointLabel!))
                        }
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
extension GroupVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sfcGroup.count / 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(SflCell.self, for: indexPath)
        cell.numberLabel.text = sfcGroup[indexPath.section * 5 + indexPath.row].numberLabel
        cell.clubImage.image = sfcGroup[indexPath.section * 5 + indexPath.row].clubImage
        cell.clubLabel.text = sfcGroup[indexPath.section * 5 + indexPath.row].clubLabel
        cell.gameLabel.text = sfcGroup[indexPath.section * 5 + indexPath.row].gameLabel
        cell.goalLabel.text = sfcGroup[indexPath.section * 5 + indexPath.row].goalLabel
        cell.pointLabel.text = sfcGroup[indexPath.section * 5 + indexPath.row].pointLabel
               
        if indexPath.row == 4 {
            cell.lineHide = true
        } else {
            cell.lineHide = false
        }
        
        if sfcGroup[indexPath.row].numberLabel == "1." || sfcGroup[indexPath.row].numberLabel == "2." {
            cell.numberLabel.backgroundColor = UIColor(hexString: "#FE8078")
            cell.numberLabel.textColor = .white
        } else {
            cell.numberLabel.backgroundColor = .clear
            cell.numberLabel.textColor = UIColor(hexString: "#2C435B")
        }
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension GroupVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 30
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        if section == 0 {
            headerView.titleLabel.text = "Group A"
        } else if section == 1 {
            headerView.titleLabel.text = "Group B"
        } else if section == 2{
            headerView.titleLabel.text = "Group C"
        } else {
            headerView.titleLabel.text = "Group D"
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

//MARK: - ConfigUI
extension GroupVC {
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
