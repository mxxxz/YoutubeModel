//
//  MenuBar.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    //reuse indetifier
    let cellID = "MenuBarCellID"
    //collection view
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        //protocols
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var homeController: HomeController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //add and setup collection view
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        //register menu cell
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
        
        //set default selected menu item
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        
        setupHorizontalBar()
    }
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupHorizontalBar(){
        //bottom white line
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = .white
        horizontalBarView.alpha = 0.95
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        //anchors
        //change x position
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    //did select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let currentX = CGFloat(indexPath.item) * frame.width / 4
//        self.horizontalBarLeftAnchorConstraint?.constant = currentX
        
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        
        
        //animate
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.layoutIfNeeded()
//        }, completion: nil)
        
        
    }
    
    
    //--collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //array with images for menu bar
    let menuImages = [#imageLiteral(resourceName: "home"), #imageLiteral(resourceName: "trending"), #imageLiteral(resourceName: "subscriptions"), #imageLiteral(resourceName: "account")]
    //cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        
        let currentImage = menuImages[indexPath.row]
        
        cell.imageView.image = currentImage.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        
        return cell
    }
    //set cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    //disable spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    
    //default
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
