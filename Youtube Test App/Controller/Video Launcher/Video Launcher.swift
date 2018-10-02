//
//  Video Launcher.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 19.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView  {
    
    let activityIndicatorView: UIActivityIndicatorView = {
       let ai = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.startAnimating()
        return ai
    }()
    
    let pauseButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        
        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePause(){
        pauseButton.isHidden = true
        player?.pause()
        playButton.isHidden = false
    }
    
    let playButton: UIButton = {
       let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        
        button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePlay(){
        playButton.isHidden = true
        player?.play()
        pauseButton.isHidden = false
    }
    
    
    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 1)
        return view
    }()
    
    let videoCurrentLabel: UILabel = {
       let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    
    
    let videoLenghtLabel: UILabel = {
       let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .right
        return label
    }()
    
    let videoSlider: UISlider = {
       let slider = UISlider()
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .white
        slider.setThumbImage(#imageLiteral(resourceName: "thumb"), for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc func handleSliderChange(){
        if let duration = player?.currentItem?.duration {
            let totalSeconds = CMTimeGetSeconds(duration)
            
            let value = Float64(videoSlider.value) * totalSeconds
            
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            
            player?.seek(to: seekTime, completionHandler: { (completedSeek) in
                
            })
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setup player
        setupPlayerView()
        
        setupGradientLayer()
        
        controlsContainerView.frame = frame
        addSubview(controlsContainerView)
        
        
        controlsContainerView.addSubview(activityIndicatorView)
        //ai anchors
        activityIndicatorView.centerXAnchor.constraint(equalTo: controlsContainerView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: controlsContainerView.centerYAnchor).isActive = true
        
        //pause button
        controlsContainerView.addSubview(pauseButton)
        //pause button anchors
        pauseButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pauseButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        //play button
        controlsContainerView.addSubview(playButton)
        //play button anchors
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        controlsContainerView.addSubview(videoLenghtLabel)
        
        videoLenghtLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        videoLenghtLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        videoLenghtLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        videoLenghtLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        //video current time
        controlsContainerView.addSubview(videoCurrentLabel)
        videoCurrentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        videoCurrentLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        videoCurrentLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        videoCurrentLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        let test = videoCurrentLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        //slider
        controlsContainerView.addSubview(videoSlider)
        videoSlider.rightAnchor.constraint(equalTo: videoLenghtLabel.leftAnchor).isActive = true
        videoSlider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        videoSlider.leftAnchor.constraint(equalTo: videoCurrentLabel.rightAnchor).isActive = true
        videoSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        //general back color
        backgroundColor = .black
    }
    
    var player: AVPlayer?
    
    private func setupPlayerView(){
        let urlString = "https://firebasestorage.googleapis.com/v0/b/pubg-messenger.appspot.com/o/A%20short%20ocean%20video.mp4?alt=media&token=c2531f5b-ddf8-4bbf-a80f-ab024ab18229"
        
        if let url = URL(string: urlString) {
            player = AVPlayer(url: url)
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            //observer
            player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
            
            player?.play()
            //track player progress
            let interval = CMTime(value: 1, timescale: 2)
            player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in
                
                let seconds = CMTimeGetSeconds(progressTime)
                let secondsString = String(format: "%02d", Int(seconds) % 60)
                let minutesString = String(format: "%02d", Int(seconds) / 60)
                
                self.videoCurrentLabel.text = "\(minutesString):\(secondsString)"
                
                //lets move the slider thumb
                if let duration = self.player?.currentItem?.duration {
                    let durationSeconds = CMTimeGetSeconds(duration)
                    
                    self.videoSlider.value = Float(seconds / durationSeconds)
                }
                
            })
            
        }
    }
    //observe video load status
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.loadedTimeRanges" {
            activityIndicatorView.stopAnimating()
            controlsContainerView.backgroundColor = .clear
            pauseButton.isHidden = false
            playButton.isHidden = true
            
            
            if let duration = player?.currentItem?.duration {
                let seconds = CMTimeGetSeconds(duration)
                
                let secondsText = Int(seconds) % 60
                let minutesText = String(format: "%02d", Int(seconds) / 60)
                
                videoLenghtLabel.text = "\(minutesText):\(secondsText)"
            }
            
            
            //slider setup

        }
    }
    
    private func setupGradientLayer(){
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = bounds
        
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.2]
        
        
        controlsContainerView.layer.addSublayer(gradientLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoLauncher: NSObject {

    func showVideoPlayer(){
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = .white
            //get status bar height
            let y = UIApplication.shared.statusBarFrame.size.height
            //set general view frame
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            //16 x 9 is the aspect ratio of all HD videos
            let height = keyWindow.frame.width * 9 / 16
            //set video player view frame
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            
            //add video player view
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            view.addSubview(videoPlayerView)
            
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                view.frame = CGRect(x: 0, y: y, width: keyWindow.frame.width, height: keyWindow.frame.height - y)
                
            }, completion: nil)
        }
    }
}
