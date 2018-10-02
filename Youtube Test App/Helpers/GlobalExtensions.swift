//
//  GlobalExtensions.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


