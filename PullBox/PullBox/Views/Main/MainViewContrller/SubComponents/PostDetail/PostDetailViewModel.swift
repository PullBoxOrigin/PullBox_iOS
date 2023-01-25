//
//  PostDetailViewModel.swift
//  PullBox
//
//  Created by mingmac on 2023/01/24.
//

import Foundation
import LinkPresentation

struct PostDetailViewModel {
    let postDetailData: PostDetailModel
    
    init(postDetailData: PostDetailModel) {
        self.postDetailData = postDetailData
    }

    func fetchURLPreview(url: URL) {
        let metadataProvider = LPMetadataProvider()
        metadataProvider.startFetchingMetadata(for: url) { metadata, error in
            if let data = metadata, error == nil {
                DispatchQueue.main.async {
                    postDetailData.linkView.metadata = data
                }
            } else {
                print(error.debugDescription)
            }
        }
    }
}
