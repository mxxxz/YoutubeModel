//
//  SettingsLauncher+collectionView.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 15.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension SettingsLaucher {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //dismiss animated
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionViewSettings.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: self.getHeightByDevice())
            }
            //and after end of animate push selected controller
        }, completion: { (completion: Bool) in
            if completion{
                let setting = self.setting[indexPath.item]
                //if selected cell is no equaly Cancel -> push 
                if setting.title != .Cancel{
                    self.homeController?.showControllerForSettings(setting: setting)
                }
            }
        })
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setting.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingsLaucherCell
        
        let set = setting[indexPath.row]


        cell.setting = set
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewSettings.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
