//
//  PostDetailViewController.swift
//  PullBox
//
//  Created by mingmac on 2023/01/13.
//

import Foundation
import UIKit
import SnapKit

final class PostDetailViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var viewModel: PostDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setNavigationBar()
        hidesBottomBarWhenPushed = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .label
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    private func setTableView() {
        tableView.register(PostDetailViewCell.self, forCellReuseIdentifier: "PostDetailViewCell")
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PostDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailViewCell", for: indexPath) as? PostDetailViewCell else {
            return UITableViewCell() }
        let viewModel = viewModel?.postDetailData
        cell.profileImageView.image = UIImage(systemName: viewModel?.profileImageView ?? "star")
        cell.nameLabel.text = viewModel?.name ?? "Devki"
        cell.hashtagLabel.text = viewModel?.hashtag ?? "#iOS"
        cell.titleLabel.text = viewModel?.title ?? "한글 Lorem Ipsum."
        cell.descriptionLabel.text = viewModel?.description ??
        """
        정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 대한민국은 민주공화국이다. 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한 소비자보호운동을 법률이 정하는 바에 의하여 보장한다.
        
        저작자·발명가·과학기술자와 예술가의 권리는 법률로써 보호한다. 국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.
        정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 대한민국은 민주공화국이다. 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한 소비자보호운동을 법률이 정하는 바에 의하여 보장한다.
        
        저작자·발명가·과학기술자와 예술가의 권리는 법률로써 보호한다. 국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.
        정부는 예산에 변경을 가할 필요가 있을 때에는 추가경정예산안을 편성하여 국회에 제출할 수 있다. 대한민국은 민주공화국이다. 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한 소비자보호운동을 법률이 정하는 바에 의하여 보장한다.
                        
        저작자·발명가·과학기술자와 예술가의 권리는 법률로써 보호한다. 국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에 관한 규제와 조정을 할 수 있다.
                        
        """
        cell.scrapImageView.image = UIImage(systemName: "bookmark")

        return cell
    }    
}

extension PostDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewHeight = view.frame.height
        return viewHeight
    }
}
