//
//  Home+collectionView.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension HomeController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        var identifier: String?
        
        
        identifier = getCurrentIdentifier(indexPathRow: indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier!, for: indexPath)


        return cell
    }
    //get the current active cell
    private func getCurrentIdentifier(indexPathRow: IndexPath.ArrayLiteralElement) -> String {
        switch indexPathRow {
        case 1:
            return trendingCellID
        case 2:
            return subscriptionCellID
        default:
            return cellID
        }
    }
    
}


extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 85)
    }
}
