//
//  MainModel.swift
//  PullBox
//
//  Created by mingmac on 2023/01/18.
//

import Foundation
import RxSwift
import UIKit

struct MainModel {
    let profileImageView: String
    let name: String
    let hashtag: String
    let description: String
    
    init(profileImageView: String, name: String, hashtag: String, description: String) {
        self.profileImageView = profileImageView
        self.name = name
        self.hashtag = hashtag
        self.description = description
    }
}
