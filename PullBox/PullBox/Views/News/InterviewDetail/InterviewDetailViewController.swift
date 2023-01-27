//
//  InterviewDetailViewController.swift
//  PullBox
//
//  Created by mingmac on 2023/01/27.
//

import Foundation
import UIKit
import SnapKit

final class InterviewDetailViewController: UIViewController {
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        setNavigationBar()
        setTableView()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .label
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(InterviewDetailCell.self, forCellReuseIdentifier: "InterviewDetailCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension InterviewDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InterviewDetailCell", for: indexPath) as? InterviewDetailCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

extension InterviewDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
