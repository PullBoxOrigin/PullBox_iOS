//
//  ResumeTipsCollectionViewCell.swift
//  PullBox
//
//  Created by mingmac on 2023/01/27.
//

import Foundation
import UIKit
import SnapKit

final class ResumeTipsCollectionViewCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    private let previewImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setComponents()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setComponents() {
        self.backgroundColor = .systemOrange
        self.layer.cornerRadius = 4
        
        titleLabel.font = .pretendardFont(size: 16, style: .bold)
        titleLabel.textColor = .label
        titleLabel.text  = "이력서 작성 팁 모아보기"
        
        previewImageView.backgroundColor = .lightGray
        previewImageView.layer.cornerRadius = 4
    }
    
    override func layoutSubviews() {
        [titleLabel, previewImageView].forEach { contentView.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        previewImageView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.width.equalTo(130)
            $0.height.equalTo(80)
        }
    }
}
