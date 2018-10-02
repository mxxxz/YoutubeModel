//
//  SettingsLaucherCell.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 15.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class SettingsLaucherCell: BaseCell {
    
    //use data to cell
    var setting: Setting? {
        didSet{
            title.text = (setting?.title).map { $0.rawValue }
            imageView.image = setting?.image.withRenderingMode(.alwaysTemplate)
        }
    }
    //handle highlight
    override var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ? UIColor.lightGray : .white
            title.textColor = isHighlighted ? UIColor.darkGray : UIColor.lightGray
            imageView.tintColor = isHighlighted ? UIColor.darkGray : UIColor.lightGray
        }
    }
    //icon
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = UIColor.lightGray
        return iv
    }()
    //title of cell
    let title: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(title)
        
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        title.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 15).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
