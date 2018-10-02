//
//  GeneralController.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit


class HomeController: UICollectionViewController {
    //titles for nav bar
    let titles = ["Home", "Trending", "Subscriptions", "Account"]
    //menu laucher
    lazy var settingsLaucher : SettingsLaucher = {
        let laucher = SettingsLaucher()
        laucher.homeController = self
        return laucher
    }()
    //reuse identifier
    let cellID = "FeedCell"
    //subclasses
    let trendingCellID = "trendingCellID"
    let subscriptionCellID = "subscriptionCellID"
    
    //blanket for iphone x
    let blanketView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        view.isHidden = true
        return view
    }()
    
    //menu bar
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.homeController = self
        return mb
    }()
    
    //collection view setup
    private func collectionViewSetup(){
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            //change scroll direction from vertical(default) to horizontal
            flowLayout.scrollDirection = .horizontal
            //disable space between horizontal cells
            flowLayout.minimumLineSpacing = 0
        }
        //default back color
        collectionView?.backgroundColor = .white
        //make inset for collection view
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        //make inset for collection view scroll indicator
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        //set scroll always
        collectionView?.alwaysBounceVertical = true
        //use paging
        collectionView?.isPagingEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collection view setup
        collectionViewSetup()
        
        //nav bar setup
        setupNavBar()
        
        //setup blanket
        setupBlanketView()
        
        //register cells
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellID)
        collectionView?.register(SubscriptionCell.self, forCellWithReuseIdentifier: subscriptionCellID)
        
        //setup menu bar
        setupMenuBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //check model for correct display
        handleDevice()
    }
}

