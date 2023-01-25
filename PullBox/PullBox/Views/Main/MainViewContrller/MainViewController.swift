//
//  MainViewController.swift
//  PullBox
//
//  Created by mingmac on 2023/01/06.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private lazy var tableList = UITableView(frame: .zero, style: .grouped)
    private var viewModel: MainListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableList.reloadData()
    }

    private func setNavigationBar() {
        let searchBar = SearchBar()
        navigationItem.titleView = searchBar
    }
    
    private func setTableView() {
        tableList.dataSource = self
        tableList.delegate = self
        
        tableList.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableList.backgroundColor = .white
        tableList.separatorStyle = .none
        tableList.showsVerticalScrollIndicator = false
        
        view.addSubview(tableList)
        tableList.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.dataList.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        let mainViewModel = viewModel?.tableListAtIndex(indexPath.section)
        cell.profileImageView.image = UIImage(systemName: mainViewModel?.mainModel.profileImageView ?? "star")
        cell.nameLabel.text = mainViewModel?.mainModel.name ?? "Devki"
        cell.hashtagLabel.text = mainViewModel?.mainModel.hashtag ?? "#iOS"
        cell.descriptionLabel.text = mainViewModel?.mainModel.description ??
            """
            xptmxpxmtlkaslkdulqfgbnlskjxptmxpxmtlkaslkdulqfgbnlskj
            xptmxpxmtlkaslkdulqfgbnlskjxptmxpxmtlkaslkdulqfgbnlskj
            xptmxpxmtlkaslkdulqfgbnlskjxptmxpxmtlkaslkdulqfgbnlskj
            xptmxpxmtlkaslkdulqfgbnlskjxptmxpxmtlkaslkdulqfgbnlskj
            """
        
//        cell.bind(mainViewModel)
        cell.selectionStyle = .none
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.cornerRadius = 8
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postDetailVC = PostDetailViewController()
        self.navigationController?.pushViewController(postDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
