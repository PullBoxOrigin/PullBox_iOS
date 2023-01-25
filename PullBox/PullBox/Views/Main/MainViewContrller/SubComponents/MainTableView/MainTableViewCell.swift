//
//  MainTableViewCell.swift
//  PullBox
//
//  Created by mingmac on 2023/01/16.
//

import Foundation
import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let hashtagLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.backgroundColor = UIColor.black
        profileImageView.layer.cornerRadius = 36 / 2
        
        nameLabel.font = .pretendardFont(size: 12, style: .regular)
        
        hashtagLabel.font = .pretendardFont(size: 12, style: .bold)
        
        descriptionLabel.font = .pretendardFont(size: 15, style: .regular)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.lineBreakMode = .byTruncatingTail
        
        [profileImageView, nameLabel, hashtagLabel, descriptionLabel].forEach { contentView.addSubview($0) }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(36)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
        }
        
        hashtagLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
//    func bind(_ viewModel: MainViewModel) {
//        profileImageView.image = UIImage(systemName: viewModel.mainModel.profileImageView)
//        nameLabel.text = viewModel.mainModel.name
//        hashtagLabel.text = "#\(viewModel.mainModel.hashtag)"
//        descriptionLabel.text = viewModel.mainModel.description
//    }
}
