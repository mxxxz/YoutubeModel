//
//  Home+anchors.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 14.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension HomeController {
    //blanket anchors setup
    func setupBlanketView(){
        view.addSubview(blanketView)
        
        blanketView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blanketView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        blanketView.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    //menu bar anchors setup
    func setupMenuBar(){
        //hide nav bar no swipe
        navigationController?.hidesBarsOnSwipe = true
        
        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        
        view.addSubview(redView)
        
        redView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        view.addSubview(menuBar)
        
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //top achor to safe area always
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        
    }
}
