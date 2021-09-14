//
//  QualificationVC.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/22/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class QualificationVC: UIViewController {
    
    var sfcTable: [Tablesfc] = []
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        makeTable()
    }
    
    //MARK: - UI Components
    private lazy var myTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
        
        $0.registerCell(SflCell.self)
    }
    
    let headerView1 = HeaderView().then {
        $0.isHidden = true
    }
    
    let headerView2 = HeaderView().then {
        $0.isHidden = true
    }
    
    let headerView3 = HeaderView().then {
        $0.isHidden = true
    }
    
    let headerView4 = HeaderView().then {
        $0.isHidden = true
    }
}

//MARK: - Methods
extension QualificationVC {
    func makeTable() {
        db.collection("quaSfc").getDocuments() { (querySnapshot, err) in
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
                            self.sfcTable.append(Tablesfc(numberLabel: numberLabel!, clubImage: UIImage(named: clubLabel!)!, clubLabel: clubLabel!, gameLabel: gameLabel!, goalLabel: goalLabel!, pointLabel: pointLabel!))
                        } else {
                            self.sfcTable.append(Tablesfc(numberLabel: numberLabel!, clubImage: UIImage.init(), clubLabel: clubLabel!, gameLabel: gameLabel!, goalLabel: goalLabel!, pointLabel: pointLabel!))
                        }
                    }
                                        
                    DispatchQueue.main.async {
                        self.myTableView.reloadData()
                    }
                    self.headerView1.isHidden = false
                    self.headerView2.isHidden = false
                    self.headerView3.isHidden = false
                    self.headerView4.isHidden = false
                }
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension QualificationVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sfcTable.count / 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(SflCell.self, for: indexPath)
        cell.numberLabel.text = sfcTable[indexPath.section * 5 + indexPath.row].numberLabel
        cell.clubImage.image = sfcTable[indexPath.section * 5 + indexPath.row].clubImage
        cell.clubLabel.text = sfcTable[indexPath.section * 5 + indexPath.row].clubLabel
        cell.gameLabel.text = sfcTable[indexPath.section * 5 + indexPath.row].gameLabel
        cell.goalLabel.text = sfcTable[indexPath.section * 5 + indexPath.row].goalLabel
        cell.pointLabel.text = sfcTable[indexPath.section * 5 + indexPath.row].pointLabel
        
        if indexPath.row == 4 {
            cell.lineHide = true
        } else {
            cell.lineHide = false
        }
        
        if sfcTable[indexPath.row].numberLabel == "1." || sfcTable[indexPath.row].numberLabel == "2." {
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
extension QualificationVC: UITableViewDelegate {
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
        if section == 0 {
            headerView1.titleLabel.text = "Group A"
            return headerView1
        } else if section == 1 {
            headerView2.titleLabel.text = "Group B"
            return headerView2
        } else if section == 2 {
            headerView3.titleLabel.text = "Group C"
            return headerView3
        } else {
            headerView4.titleLabel.text = "Group D"
            return headerView4
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

//MARK: - ConfigUI
extension QualificationVC {
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
