//
//  Home+scroll.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 15.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension HomeController {
    //scroll menubar cell for current controller
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //handle and change position of menubar horizontal view line
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    //get position of menu for highlighte menubar image
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //get current item
        let item = targetContentOffset.pointee.x / view.frame.width
        //create index path
        let indexPath = IndexPath(item: Int(item), section: 0)
        //and set select item
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
        setTitleForIndex(index: Int(item))
    }
}
