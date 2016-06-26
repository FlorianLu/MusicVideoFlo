//
//  ViewController.swift
//  MusicVideoFlo
//
//  Created by Florian LUDOT on 25/06/16.
//  Copyright © 2016 Florian LUDOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

    func didLoadData(result:String){
        
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
            //do something if you want
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated:true, completion: nil)
        
        
    }
        
    
    
    

}

