//
//  InterviewDetailCell.swift
//  PullBox
//
//  Created by mingmac on 2023/01/27.
//

import Foundation
import UIKit
import SnapKit

final class InterviewDetailCell: UITableViewCell {
    private let someView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        someView.backgroundColor = .lightGray
        
        addSubview(someView)
        
        someView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
