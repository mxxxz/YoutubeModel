//
//  Home+navigationBar.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension HomeController{
    func setupNavBar(){
        navigationController?.navigationBar.isTranslucent = false
        //title setup
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.textColor = .white
        titleLabel.text = "  Home"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        //right bar buttons
        let searchBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearch))
        
        
        let moreBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem,searchBarButtonItem]
    }
    
    
    
    
    //handle search bar button action
    @objc func handleSearch(){
    }
    
    @objc func handleMore(){
        settingsLaucher.showSettings()
    }
    
    

    
}

