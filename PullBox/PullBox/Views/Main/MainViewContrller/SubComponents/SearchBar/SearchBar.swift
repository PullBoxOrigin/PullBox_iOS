//
//  SearchBar.swift
//  PullBox
//
//  Created by mingmac on 2023/01/13.
//

import Foundation
import UIKit
import SnapKit

class SearchBar: UIView {

    lazy var searchBarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.sizeToFit()
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    lazy var placerHolderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .placeholderText
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "검색"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        self.backgroundColor = .gray
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8
    }

    private func layout() {
        [searchBarImageView, placerHolderLabel].forEach { addSubview($0) }
        
        searchBarImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(4)
        }
        
        placerHolderLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchBarImageView.snp.trailing).offset(8)
        }
    }
}
