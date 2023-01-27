//
//  NewsHeaderViews.swift
//  PullBox
//
//  Created by mingmac on 2023/01/26.
//

import Foundation
import UIKit
import SnapKit

final class MostViewedHeaderView: UICollectionReusableView {
    static let identifier = "NewsHeaderView"
    
    lazy var headerView: UILabel = {
        let label = UILabel()
        label.font = .pretendardFont(size: 16, style: .bold)
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(headerView)

        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
        }
    }
}

final class CollectHeaderView: UICollectionReusableView {
    static let identifier = "collectHeaderView"
    
    lazy var headerView: UILabel = {
        let label = UILabel()
        label.font = .pretendardFont(size: 16, style: .bold)
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(headerView)

        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
        }
    }
}
