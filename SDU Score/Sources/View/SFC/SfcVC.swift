//
//  SfcVC.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/21/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class SfcVC: UIViewController {
    
    private var stages = ["Qualification stage", "Group stage", "Play-off stage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    //MARK: - UI Components
    private lazy var myTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self        
        
        $0.registerCell(SfcCell.self)
    }
}

//MARK: - Methods
extension SfcVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "qualificationSegue" {
            let destination = segue.destination as! QualificationVC
            destination.navigationItem.title = "Qualification Round"
        } else if segue.identifier == "groupSegue" {
            let destination = segue.destination as! GroupVC
            destination.navigationItem.title = "Group Stage"
        } else {
            let destination = segue.destination as! PlayOffVC
            destination.navigationItem.title = "Play-Off"
        }
    }
}

//MARK: - UITableViewDataSource
extension SfcVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(SfcCell.self, for: indexPath)
        cell.stageLabel.text = stages[indexPath.row]
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SfcVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            performSegue(withIdentifier: "qualificationSegue", sender: self)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "groupSegue", sender: self)
        } else {
            performSegue(withIdentifier: "playoffSegue", sender: self)
        }
    }
}

//MARK: - ConfigUI
extension SfcVC {
    private func setupViews() {
        view.addSubview(myTableView)
        
        self.tabBarItem.title = "SFC"
        self.navigationItem.title = "SFC"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)]
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "#FE8078")
        
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
