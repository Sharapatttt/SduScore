//
//  AboutVC.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 12/12/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    //MARK: - UI Components
    private lazy var myTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
        
        $0.registerCell(AboutCell.self)
        $0.registerCell(HighlightsCell.self)
    }
}

//MARK: - UITableViewDataSource
extension AboutVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueCell(AboutCell.self, for: indexPath)
        
            return cell
        } else {
            let cell = tableView.dequeueCell(HighlightsCell.self, for: indexPath)
            
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension AboutVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - ConfigUI
extension AboutVC {
    private func setupViews() {
        view.addSubview(myTableView)
        
        self.tabBarItem.title = "About Us"
        self.navigationItem.title = "About Us"
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
