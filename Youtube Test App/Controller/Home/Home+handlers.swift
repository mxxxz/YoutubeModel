//
//  Home+handlers.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//
import UIKit

extension HomeController{
    //handle device
    func handleDevice(){
        switch UIDevice.modelName {
        case "Simulator iPhone X","iPhone X":
            blanketView.isHidden = false
            break
        default:
            break
        }
    }
    
    //push controller from settings laucher
    func showControllerForSettings(setting: Setting){
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.navigationItem.title = setting.title.rawValue
        dummySettingsViewController.view.backgroundColor = .white
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at:indexPath, at: [], animated: true)
        
        setTitleForIndex(index: menuIndex)
    }
    
    //change nav bar title by horizontal cell
    func setTitleForIndex(index: Int){
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  " + titles[index]
        }
    }
}
