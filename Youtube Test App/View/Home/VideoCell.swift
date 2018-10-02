//
//  HomeCell.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 13.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    
    var video: Video? {
        didSet{
            //load thumbnail image
            
            guard let thumbnailImageUrl = video?.thumbnailImageName else { return }
            
            thumbnailImageView.loadImageUsingCacheWithUrlString(urlString: thumbnailImageUrl) { (Result) in
                if Result{
                    self.thumbnailActivityIndicator.stopAnimating()
                    self.thumbnailActivityIndicator.isHidden = true
                }
            }
            
            //video title
            
            videoTitleLabel.text = video?.title
            
            //load user profile image
            
            guard let userProfileImageUrl = video?.channel.profileImageName else { return }
            
            userProfileImage.loadImageUsingCacheWithUrlString(urlString: userProfileImageUrl)
            { (Result) in}

            //channel setup

            guard let channelName = video?.channel.name, let videoNumberOfViews = video?.numberOfViews else { return }
            //formatter
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal


            if video != nil {
                channelNameView.text = channelName + " •"

                let views = numberFormatter.string(from: videoNumberOfViews as NSNumber)
                
                viewsAndUploadDateView.text = "\(views!) • 2 years ago"
            }

        }
    }
    
    //ai
    let thumbnailActivityIndicator: UIActivityIndicatorView = {
       let ai = UIActivityIndicatorView()
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.color = .red
        ai.startAnimating()
        ai.isHidden = false
        return ai
    }()
    
    //view thumb image
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return imageView
    }()
    //user profile image
    let userProfileImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return imageView
    }()
    //video title label
    let videoTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let channelNameView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        return label
    }()
    let viewsAndUploadDateView: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    //default separator
    let separator: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    //setup
    override func setupViews(){
        
        
        addSubview(thumbnailImageView)
        addSubview(userProfileImage)
        addSubview(videoTitleLabel)
        addSubview(channelNameView)
        addSubview(viewsAndUploadDateView)
        
        addSubview(thumbnailActivityIndicator)
        
        
        //video thumb image
        thumbnailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        thumbnailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: userProfileImage.topAnchor, constant: -8).isActive = true
        
        //user profile image
        userProfileImage.widthAnchor.constraint(equalToConstant: 44).isActive = true
        userProfileImage.heightAnchor.constraint(equalToConstant: 44).isActive = true
        userProfileImage.leftAnchor.constraint(equalTo: thumbnailImageView.leftAnchor).isActive = true
        userProfileImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        //video title
        videoTitleLabel.leftAnchor.constraint(equalTo: userProfileImage.rightAnchor, constant: 8).isActive = true
        videoTitleLabel.topAnchor.constraint(equalTo: userProfileImage.topAnchor).isActive = true
        videoTitleLabel.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor).isActive = true
        videoTitleLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        //channel name view
        channelNameView.leftAnchor.constraint(lessThanOrEqualTo: videoTitleLabel.leftAnchor).isActive = true
        channelNameView.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: 1).isActive = true
        channelNameView.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor).isActive = true
        
        
        //views and upload date view
        viewsAndUploadDateView.leftAnchor.constraint(equalTo: channelNameView.leftAnchor).isActive = true
        viewsAndUploadDateView.topAnchor.constraint(equalTo: channelNameView.bottomAnchor, constant: 1).isActive = true
        viewsAndUploadDateView.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor).isActive = true
        
        //bottom separator
        addSubview(separator)
        separator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        //ai
        thumbnailActivityIndicator.centerXAnchor.constraint(equalTo: thumbnailImageView.centerXAnchor).isActive = true
        thumbnailActivityIndicator.centerYAnchor.constraint(equalTo: thumbnailImageView.centerYAnchor).isActive = true
        thumbnailActivityIndicator.widthAnchor.constraint(equalToConstant: 44).isActive = true
        thumbnailActivityIndicator.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
