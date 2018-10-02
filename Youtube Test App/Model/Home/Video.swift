//
//  Video.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

struct Video: Decodable {
    var thumbnailImageName: String
    var title: String
    var numberOfViews: Int
    var duration: Int
    
    var channel: Channel
}

struct Channel: Decodable {
    var name: String
    var profileImageName: String
}
