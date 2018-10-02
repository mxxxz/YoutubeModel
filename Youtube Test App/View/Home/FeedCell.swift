//
//  FeedCell.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 15.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class FeedCell: BaseCell,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate  {
    //cell id
    let cellID = "VideoCell"
    
    //video
    var videos = [Video]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //protocols
        cv.delegate = self
        cv.dataSource = self
        //
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        //load videos
        handleLoadVideosData()
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    
    //collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoLauncher = VideoLauncher()
        videoLauncher.showVideoPlayer()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! VideoCell
        
        let video = videos[indexPath.item]
        cell.video = video
        
        return cell
    }
    //disable spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //set cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (frame.width - 16 - 16) * 9 / 16
        
        return CGSize(width: frame.width, height: height + 16 + 68)
    }
    
    //handle load video
    func handleLoadVideosData(){
        let service = LoadDataService.shared
        
        let urlStr = "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"
        service.fetchVideos(urlStr) { (video) in
            self.videos = video
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

}
