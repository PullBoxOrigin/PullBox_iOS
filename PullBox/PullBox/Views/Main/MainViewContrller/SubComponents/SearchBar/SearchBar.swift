//
//  SearchBar.swift
//  PullBox
//
//  Created by mingmac on 2023/01/13.
//

import Foundation
import UIKit
import SnapKit

class SearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        searchTextField.isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func attribute() {
        searchTextField.placeholder = "검색"
    }
}

