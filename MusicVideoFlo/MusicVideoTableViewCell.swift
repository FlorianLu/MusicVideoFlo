//
//  MusicVideoTableViewCell.swift
//  MusicVideoFlo
//
//  Created by Florian LUDOT on 15/07/16.
//  Copyright © 2016 Florian LUDOT. All rights reserved.
//

import UIKit

class MusicVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    
    @IBOutlet weak var rank: UILabel!
    
    @IBOutlet weak var musicTitle: UILabel!
    
    
    var video: Videos? {
        didSet {
            updateCell()
        }
    }
    
    
    func updateCell(){
        musicTitle.text = video?.vName
        rank.text = ("\(video!.vRank)")
        musicImage.image = UIImage(named: "imageNotAvailable")
        
    }
}
