//
//  APIManager .swift
//  MusicVideoFlo
//
//  Created by Florian LUDOT on 26/06/16.
//  Copyright © 2016 Florian LUDOT. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: [Videos] -> Void ) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        // let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            if error != nil {
                
                print(error!.localizedDescription)
        
            } else {
                
                //Added for JSONSerialization
                //print(data)
                do {
                    /* .AllowsFragment - top level object is not Array or Dictionnary.
                     Any type of string or value
                     NJSONSerialization requires the Do / Try / Catch
                     Convert the NSDATA into a JSON Object and cast it to a Dictionnary */
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)as? JSONDictionary,
                        feed = json["feed"] as? JSONDictionary,
                        entries = feed["entry"] as? JSONArray {
                        
                            var videos = [Videos]()
                            for (index, entry) in entries.enumerate() {
                                let entry = Videos(data: entry as! JSONDictionary)
                                entry.vRank = index + 1
                                videos.append(entry)
                            }
                        
                            let i = videos.count
                            print("iTunesApiManager - total count --> \(i)")
                            print("")
                        
                            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue()) {
                                completion(videos)
                            }
                        }
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue()) {
                        print("ERROR IN NSJSONSerialization")
                    }
                }
                //End of JSONSerialization
            }
            
        }
        task.resume()
        
    }
}