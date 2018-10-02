//
//  SettingsLaucher+handlers.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 15.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension SettingsLaucher {

    //get CGFloat variable for y position of collection view by device
    func getHeightByDevice() -> CGFloat {
        let currentHight:CGFloat = CGFloat(setting.count * 50)
        if UIDevice.modelName == "Simulator iPhone X" || UIDevice.modelName == "iPhone X" {
            return currentHight + 35
        }else{
            return currentHight
        }
    }
}
