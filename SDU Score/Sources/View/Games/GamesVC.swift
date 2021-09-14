//
//  GamesVC.swift
//  SDU Score
//
//  Created by Akzhol Imangazin on 11/21/20.
//  Copyright © 2020 Akzhol Imangazin and Madi Kupessov. All rights reserved.
//

import UIKit

class GamesVC: UIViewController {
    
    var allGames = AllGames()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    //MARK: - UI Components
    private lazy var myTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none        
        $0.registerCell(GamesCell.self)
        
        $0.dataSource = self
        $0.delegate = self
    }
    
}

//MARK: - Methods
extension GamesVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = (myTableView.indexPathForSelectedRow?.row)!
        let section = (myTableView.indexPathForSelectedRow?.section)!
        let destination = segue.destination as! GamesDetailVC
        destination.firstLabel.text = allGames.games[section * 7 + index].firstLabel
        destination.firstImage.image = allGames.games[section * 7 + index].firstImage
        destination.middleLabel.text = allGames.games[section * 7 + index].middleLabel
        destination.secondLabel.text = allGames.games[section * 7 + index].secondLabel
        destination.secondImage.image = allGames.games[section * 7 + index].secondImage
        destination.lineA = allGames.games[section * 7 + index].lineA
        destination.lineB = allGames.games[section * 7 + index].lineB
        destination.arrA = allGames.games[section * 7 + index].infoA
        destination.arrB = allGames.games[section * 7 + index].infoB
    }
}

//MARK: - UITableViewDataSource
extension GamesVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGames.games.count / 14        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(GamesCell.self, for: indexPath)
        cell.firstImage.image = allGames.games[indexPath.section * 7 + indexPath.row].firstImage
        cell.secondImage.image = allGames.games[indexPath.section * 7 + indexPath.row].secondImage
        cell.firstLabel.text = allGames.games[indexPath.section * 7 + indexPath.row].firstLabel
        cell.middleLabel.text = allGames.games[indexPath.section * 7 + indexPath.row].middleLabel
        cell.secondLabel.text = allGames.games[indexPath.section * 7 + indexPath.row].secondLabel
        
        if indexPath.row == 6 {
            cell.lineHide = true
        } else {
            cell.lineHide = false
        }
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension GamesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        performSegue(withIdentifier: "gamesSegue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = GamesHeaderView()
        headerView.titleLabel.text = "\(String(section + 1))\(" Tour")"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

//MARK: - ConfigUI
extension GamesVC {
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(myTableView)
        
        self.tabBarItem.title = "Games"        
        self.navigationItem.title = "Games"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)]
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "#FE8078")
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        myTableView.snp.makeConstraints { (m) in
            m.top.equalTo(view.safeAreaLayoutGuide)
            m.left.right.equalTo(view).offset(0)
            m.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}
