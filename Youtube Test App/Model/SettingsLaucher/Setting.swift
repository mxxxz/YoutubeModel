//
//  Setting.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 15.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
//settingsLaucher cell model
struct Setting{
    var title: SettingTitle
    var image: UIImage
    
    init(title: SettingTitle, image: UIImage) {
        self.title = title
        self.image = image
    }
}
