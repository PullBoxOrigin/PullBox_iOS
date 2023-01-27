//
//  NewsViewController.swift
//  PullBox
//
//  Created by mingmac on 2023/01/13.
//

import Foundation
import UIKit
import SnapKit

class NewsViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        setNavigationitem()
    }
    
    private func setNavigationitem() {
        let title = UILabel()
        title.text = "소식"
        title.font = .pretendardFont(size: 16, style: .bold)
        title.textColor = .label
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: title)
        
    }
    
    private func setCollectionView() {
        collectionView.collectionViewLayout = createLayout()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(MostViewedCollectionViewCell.self, forCellWithReuseIdentifier: "MostViewedCollectionViewCell")
        collectionView.register(ResumeTipsCollectionViewCell.self, forCellWithReuseIdentifier: "ResumeTipsCollectionViewCell")
        collectionView.register(InterviewTipsCollectionViewCell.self, forCellWithReuseIdentifier: "InterviewTipsCollectionViewCell")
        collectionView.register(MostViewedHeaderView.self, forSupplementaryViewOfKind: MostViewedHeaderView.identifier, withReuseIdentifier: MostViewedHeaderView.identifier)
        collectionView.register(CollectHeaderView.self, forSupplementaryViewOfKind: CollectHeaderView.identifier, withReuseIdentifier: CollectHeaderView.identifier)
        
    }
}

extension NewsViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("section \(indexPath.section), item \(indexPath.item) tapped")
        case 1:
            print("section \(indexPath.section) tapped")
            let vc = ResumeDetailViewController()
            let backButtonItem = UIBarButtonItem(title: "이력서 작성 팁", style: .plain, target: self, action: nil)
            self.navigationItem.backBarButtonItem = backButtonItem
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            print("section \(indexPath.section) tapped")
            let vc = InterviewDetailViewController()
            let backButtonItem = UIBarButtonItem(title: "면접 팁", style: .plain, target: self, action: nil)
            self.navigationItem.backBarButtonItem = backButtonItem
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            return
        }
    }
}

extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostViewedCollectionViewCell", for: indexPath) as? MostViewedCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResumeTipsCollectionViewCell", for: indexPath) as? ResumeTipsCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterviewTipsCollectionViewCell", for: indexPath) as? InterviewTipsCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case MostViewedHeaderView.identifier:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MostViewedHeaderView.identifier, for: indexPath) as! MostViewedHeaderView
            header.headerView.text = "많이 조회한 게시글"
            return header
        case CollectHeaderView.identifier:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectHeaderView.identifier, for: indexPath) as! CollectHeaderView
            header.headerView.text = "모아보기"
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension NewsViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                let item = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalWidth(0.45))
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                let group = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(0.9), height: .fractionalWidth(0.45), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.2)), elementKind: MostViewedHeaderView.identifier, alignment: .topLeading)
                section.boundarySupplementaryItems = [header]
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            case 1:
                let item = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.2))
                let group = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(0.2), subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20)
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.2)), elementKind: CollectHeaderView.identifier, alignment: .topLeading)
                section.boundarySupplementaryItems = [header]
                return section
            case 2:
                let item = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.2))
                let group = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(0.2), subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                return section
            default:
                return nil
            }
        }
    }
}
