//
//  SflVC.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/21/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class SflVC: UIViewController {
        
    var sflTable: [Tablesfl] = []
    var sflStriker: [Striker] = []
    var sflAssist: [Assist] = []
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

        makeTable()
        makeStriker()
        makeAssist()
    }
    
    //MARK: - UI Components
    var mySegmentControl = UISegmentedControl().then {
        $0.insertSegment(withTitle: "Table", at: 0, animated: true)
        $0.insertSegment(withTitle: "Striker", at: 1, animated: true)
        $0.insertSegment(withTitle: "Assist", at: 2, animated: true)
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
        
        $0.registerCell(SflCell.self)
        $0.registerCell(StrikerCell.self)
        $0.registerCell(AssistCell.self)
    }
}

//MARK: - Action
extension SflVC {
    @objc func handleSegmentChange() {
        myTableView.reloadData()
    }
    
    func makeTable() {
        db.collection("SFL").getDocuments() { (querySnapshot, err) in
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
                        if clubLabel != "Club" {
                            self.sflTable.append(Tablesfl(numberLabel: numberLabel!, clubImage: UIImage(named: clubLabel!)!, clubLabel: clubLabel!, gameLabel: gameLabel!, goalLabel: goalLabel!, pointLabel: pointLabel!))
                        } else {
                            self.sflTable.append(Tablesfl(numberLabel: numberLabel!, clubImage: UIImage.init(), clubLabel: clubLabel!, gameLabel: gameLabel!, goalLabel: goalLabel!, pointLabel: pointLabel!))
                        }
                    }
                    DispatchQueue.main.async {
                        self.myTableView.reloadData()
                    }
                }
            }
        }
    }
    
    func makeStriker() {
        db.collection("strikerSfl").getDocuments() { (querySnapshot, err) in
            if let err = err {
            print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let data = document.data() as? [String: Any] {
                        let numberLabel = data["numberLabel"] as? String
                        let nameLabel = data["nameLabel"] as? String
                        let goal_assistLabel = data["goal_assistLabel"] as? String
                        let clubName = data["clubName"] as? String
                        self.sflStriker.append(Striker.init(numberLabel: numberLabel!, clubImage: UIImage.init(named: clubName!)!, nameLabel: nameLabel!, goal_assistLabel: goal_assistLabel!))
                    }
                    DispatchQueue.main.async {
                        self.myTableView.reloadData()
                    }
                }
            }
        }
    }
    
    func makeAssist() {
        db.collection("assistSfl").getDocuments() { (querySnapshot, err) in
            if let err = err {
            print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let data = document.data() as? [String: Any] {
                        let numberLabel = data["numberLabel"] as? String
                        let nameLabel = data["nameLabel"] as? String
                        let goal_assistLabel = data["goal_assistLabel"] as? String
                        let clubName = data["clubName"] as? String
                        self.sflAssist.append(Assist.init(numberLabel: numberLabel!, clubImage: UIImage.init(named: clubName!)!, nameLabel: nameLabel!, goal_assistLabel: goal_assistLabel!))
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
extension SflVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mySegmentControl.selectedSegmentIndex == 0 {
            return sflTable.count
        } else if mySegmentControl.selectedSegmentIndex == 1 {
            return sflStriker.count
        } else {
            return sflAssist.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if mySegmentControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueCell(SflCell.self, for: indexPath)

            cell.numberLabel.text = sflTable[indexPath.row].numberLabel
            cell.clubImage.image = sflTable[indexPath.row].clubImage
            cell.clubLabel.text = sflTable[indexPath.row].clubLabel
            cell.gameLabel.text = sflTable[indexPath.row].gameLabel
            cell.goalLabel.text = sflTable[indexPath.row].goalLabel
            cell.pointLabel.text = sflTable[indexPath.row].pointLabel
            
            if sflTable[indexPath.row].numberLabel == "1." || sflTable[indexPath.row].numberLabel == "2." || sflTable[indexPath.row].numberLabel == "3." {
                cell.numberLabel.backgroundColor = UIColor(hexString: "#2C435B")
                cell.numberLabel.textColor = .white
            } else {
                cell.numberLabel.backgroundColor = .white
                cell.numberLabel.textColor = UIColor(hexString: "#2C435B")
            }
            
            return cell
        } else if mySegmentControl.selectedSegmentIndex == 1 {
            let cell = tableView.dequeueCell(StrikerCell.self, for: indexPath)
            cell.numberLabel.text = sflStriker[indexPath.row].numberLabel
            cell.clubImage.image = sflStriker[indexPath.row].clubImage
            cell.nameLabel.text = sflStriker[indexPath.row].nameLabel
            cell.goal_assistLabel.text = sflStriker[indexPath.row].goal_assistLabel
            
            return cell
        } else {
            let cell = tableView.dequeueCell(AssistCell.self, for: indexPath)
            cell.numberLabel.text = sflAssist[indexPath.row].numberLabel
            cell.clubImage.image = sflAssist[indexPath.row].clubImage
            cell.nameLabel.text = sflAssist[indexPath.row].nameLabel
            cell.goal_assistLabel.text = sflAssist[indexPath.row].goal_assistLabel
            
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension SflVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if mySegmentControl.selectedSegmentIndex == 0 {
            if indexPath.row == 0 {
                return 30
            } else {
                return 60
            }
        } else {
            return 60
        }
    }
}

//MARK: - ConfigUI
extension SflVC {
    private func setupViews() {
        view.addSubview(mySegmentControl)
        view.addSubview(myTableView)
        
        self.tabBarItem.title = "SFL"
        self.navigationItem.title = "SFL"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)]
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "#FE8078")
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        mySegmentControl.snp.makeConstraints { (m) in
            m.top.equalTo(view.safeAreaLayoutGuide)
            m.left.right.equalTo(view).offset(0)
            m.height.equalTo(30)
        }
        
        myTableView.snp.makeConstraints { (m) in
            m.top.equalTo(mySegmentControl.snp.bottom).offset(0)
            m.left.right.equalTo(view).offset(0)
            m.bottom.equalTo(view).offset(0)
        }
        
    }
}
