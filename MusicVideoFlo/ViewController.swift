//
//  ViewController.swift
//  MusicVideoFlo
//
//  Created by Florian LUDOT on 25/06/16.
//  Copyright © 2016 Florian LUDOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

    func didLoadData(videos: [Videos]) {
        
        self.videos = videos
        
        for item in videos {
            print("name = \(item.vName)")
        }
        
        for(index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
    }
        
    
    
    

}

