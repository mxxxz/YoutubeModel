//
//  Load data service.swift
//  Youtube Test App
//
//  Created by Dmitry Grusha on 14.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation

class LoadDataService{
    
    private init(){}
    
    static let shared = LoadDataService()
    
    let decoder = JSONDecoder()
    
    func fetchVideos(_ urlStr: String, onSuccess: @escaping([Video])-> Void){
        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if error != nil {
                print("error")
                return
            }
            
            guard let data = data else { return }

            do {
                self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                let video = try self.decoder.decode([Video].self, from: data)
                onSuccess(video)
            }catch{
                print("error")

            }
            
        }.resume()
    }
}
