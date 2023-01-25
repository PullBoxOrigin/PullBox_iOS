//
//  MainViewModel.swift
//  PullBox
//
//  Created by mingmac on 2023/01/13.
//

import Foundation

struct MainListViewModel {
    let dataList: [MainModel]

    func tableListAtIndex(_ index: Int) -> MainViewModel {
        let dataList = self.dataList[index]
        return MainViewModel(model: dataList)
    }
}

struct MainViewModel {
    let mainModel: MainModel

    init(model: MainModel) {
        self.mainModel = model
    }
    
    private var profileImageView: String {
        return mainModel.profileImageView
    }
    
    private var name: String {
        return mainModel.name
    }
    
    private var hashtag: String {
        return mainModel.hashtag
    }
    
    private var description: String {
        return mainModel.description
    }
    
    
}
