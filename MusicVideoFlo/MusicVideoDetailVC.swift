//
//  MusicVideoDetailVC.swift
//  MusicVideoFlo
//
//  Created by Florian LUDOT on 18/07/16.
//  Copyright © 2016 Florian LUDOT. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MusicVideoDetailVC: UIViewController {

    var videos:Videos!
    
    @IBOutlet weak var vName: UILabel!
    
    @IBOutlet weak var videoImage: UIImageView!
    
    @IBOutlet weak var vGenre: UILabel!
    
    @IBOutlet weak var vPrice: UILabel!
    
    @IBOutlet weak var vRights: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = videos.vArtist
        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vRights.text = videos.vRights
        vGenre.text = videos.vGenre
        
        if videos.vImageData != nil {
            videoImage.image = UIImage(data: videos.vImageData!)
        } else {
            videoImage.image = UIImage(named: "imageNotAvalaible")
        }
        
        
 
    }
    
    
    @IBAction func socialMedia(sender: UIBarButtonItem) {
        shareMedia()
    }
    
    func shareMedia() {
        let activity1 = "Hey Dickbutt, that's a share feature test!!"
        let activity2 = ("\(videos.vName) by \(videos.vArtist)")
        let activity3 = "Watch it and tell me what do you think?"
        let activity4 = videos.vLinkToiTunes
        let activity5 = "Shared with the MusicVideoFlo App)"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [activity1, activity2, activity3, activity4, activity5], applicationActivities: nil)
        
        //activityViewController.excludedActivityTypes = [itemsToExclureHere, ...]
        
//        all UIActivityType avalaible
//        activityViewController.excludedActivityTypes = [
//                UIActivityTypeMail,
//                UIActivityTypePrint,
//                UIActivityTypeAirDrop,
//                UIActivityTypeMessage,
//                UIActivityTypePostToVimeo,
//                UIActivityTypePostToWeibo,
//                UIActivityTypeOpenInIBooks,
//                UIActivityTypePostToFlickr,
//                UIActivityTypePostToTwitter,
//                UIActivityTypePostToFacebook,
//                UIActivityTypeAssignToContact,
//                UIActivityTypeAddToReadingList,
//                UIActivityTypeCopyToPasteboard,
//                UIActivityTypeSaveToCameraRoll,
//                UIActivityTypePostToTencentWeibo
//        ]
        
        activityViewController.completionWithItemsHandler = {
            (activity, success, items, error) in
            
            if activity == UIActivityTypeMail {
                print("Email selected")
            }
        }
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func playVideo(sender: UIBarButtonItem) {
        
        let url = NSURL(string: videos.vVideoUrl)!
        
        let player = AVPlayer(URL: url)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.presentViewController(playerViewController, animated: true){
            playerViewController.player?.play()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
