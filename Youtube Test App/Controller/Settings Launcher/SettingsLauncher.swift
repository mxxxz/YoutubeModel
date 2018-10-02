//
//  SettingsLauncher.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 15.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class SettingsLaucher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //cell id
    let cellID = "settingsLauncherCell"
    //cells data
    var setting:[Setting] {
        //enum setup
        let settingsSetting = Setting(title: .Settings, image: #imageLiteral(resourceName: "settings"))
        let termsPrivacySetting = Setting(title: .TermsPrivacy, image: #imageLiteral(resourceName: "privacy"))
        let feedbackSetting = Setting(title: .Feedback, image: #imageLiteral(resourceName: "feedback"))
        let helpSetting = Setting(title: .Help, image: #imageLiteral(resourceName: "help"))
        let switchSetting = Setting(title: .Switch, image: #imageLiteral(resourceName: "switch_account"))
        let cancelSetting = Setting(title: .Cancel, image: #imageLiteral(resourceName: "cancel"))
        
        return [settingsSetting, termsPrivacySetting, feedbackSetting,helpSetting,switchSetting,cancelSetting]
    }
    
    var homeController: HomeController?

    //black background view
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    //collection view
    let collectionViewSettings: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    //handle more bar button action
    @objc func showSettings(){
        //show menu
        if let window = UIApplication.shared.keyWindow {
 
            window.addSubview(blackView)
            window.addSubview(collectionViewSettings)

            let y = window.frame.height - getHeightByDevice()
            //setup frame
            collectionViewSettings.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: getHeightByDevice())
            
            //add tap dismiss
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            //setup frame
            blackView.frame = window.frame
            
            //show animated
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 0.5
                self.collectionViewSettings.frame = CGRect(x: 0, y: y, width: window.frame.width, height: self.getHeightByDevice())
            }, completion: nil)
        }
    }
    
    //hide animated
    @objc func handleDismiss(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionViewSettings.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: self.getHeightByDevice())
            }
        }, completion: nil)
    }
    
    override init() {
        super.init()
        collectionViewSettings.alwaysBounceVertical = false
        collectionViewSettings.dataSource = self
        collectionViewSettings.delegate = self
        
        //register cell
        collectionViewSettings.register(SettingsLaucherCell.self, forCellWithReuseIdentifier: cellID)
    }

    
}
