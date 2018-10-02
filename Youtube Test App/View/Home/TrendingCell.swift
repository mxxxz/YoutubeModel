//
//  TrendingCell.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 19.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func handleLoadVideosData() {
        let service = LoadDataService.shared
        let urlStr = "https://s3-us-west-2.amazonaws.com/youtubeassets/trending.json"
        
        service.fetchVideos(urlStr) { (video) in
            self.videos = video
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
}
