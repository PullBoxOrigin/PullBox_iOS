//
//  MostViewedCollectionViewCell.swift
//  PullBox
//
//  Created by mingmac on 2023/01/26.
//

import Foundation
import UIKit
import SnapKit

class MostViewedCollectionViewCell: UICollectionViewCell {
    private let linkView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        linkView.backgroundColor = .lightGray
        
        addSubview(linkView)
        
        linkView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
