//
//  PostDetailViewCell.swift
//  PullBox
//
//  Created by mingmac on 2023/01/21.
//

import Foundation
import UIKit
import SnapKit
import LinkPresentation

final class PostDetailViewCell: UITableViewCell {
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let hashtagLabel = UILabel()
    let scrapImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    lazy var linkView = LPLinkView()
    let seperatorView = UIView()
    let commentButton = UIButton()
    var isBookmark: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commentButtonTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commentButtonTapped() {
        commentButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
    }
    
    @objc func showModal() {
        print("tapped Button")
    }
    
    override func layoutSubviews() {
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 36 / 2
        profileImageView.backgroundColor = UIColor.black
        
        nameLabel.font = .pretendardFont(size: 12, style: .regular)
        nameLabel.textColor = .label
        
        hashtagLabel.font = .pretendardFont(size: 12, style: .bold)
        hashtagLabel.textColor = .label
        
        scrapImageView.contentMode = .scaleAspectFit
        if isBookmark == false {
            scrapImageView.image = UIImage(systemName: "bookmark")
        } else {
            scrapImageView.image = UIImage(systemName: "bookmark.fill")
        }

        titleLabel.font = .pretendardFont(size: 18, style: .bold)
        titleLabel.textColor = .label
        
        descriptionLabel.font = .pretendardFont(size: 15, style: .light)
        descriptionLabel.textColor = .label
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        linkView.layer.borderColor = UIColor.lightGray.cgColor
        linkView.layer.borderWidth = 1
        linkView.layer.cornerRadius = 8
        
        seperatorView.layer.borderWidth = 1
        seperatorView.layer.borderColor = UIColor.lightGray.cgColor
        
        commentButton.setTitle("Comments", for: .normal)
        commentButton.setImage(UIImage(systemName: "text.bubble"), for: .normal)
        commentButton.titleLabel?.font = .pretendardFont(size: 16, style: .regular)
        commentButton.setTitleColor(.label, for: .normal)
        commentButton.imageEdgeInsets.left = -5
   
        [scrapImageView, commentButton].forEach { $0.tintColor = .label }
        
        [profileImageView, nameLabel, hashtagLabel, scrapImageView, titleLabel, descriptionLabel, linkView, seperatorView, commentButton].forEach { contentView.addSubview($0) }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(36)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
        }
        
        hashtagLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        scrapImageView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(30)
            $0.leading.equalTo(profileImageView.snp.leading)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(scrapImageView.snp.trailing)
        }
        
        linkView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        
        seperatorView.snp.makeConstraints {
            $0.top.equalTo(linkView.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }

        commentButton.snp.makeConstraints {
            $0.top.equalTo(seperatorView.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    func bind(_ viewModel: PostDetailViewModel) {
        profileImageView.image = UIImage(systemName: viewModel.postDetailData.profileImageView)
        nameLabel.text = viewModel.postDetailData.name
        hashtagLabel.text = viewModel.postDetailData.hashtag
        scrapImageView.image = UIImage(systemName: viewModel.postDetailData.scape)
        titleLabel.text = viewModel.postDetailData.title
        descriptionLabel.text = viewModel.postDetailData.description
    }
}
