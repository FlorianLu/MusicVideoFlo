//
//  AboutVC.swift
//  MusicVideoFlo
//
//  Created by Florian LUDOT on 23/07/16.
//  Copyright © 2016 Florian LUDOT. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
    
    @IBOutlet weak var vAboutTitle: UILabel!
    
    @IBOutlet weak var vAboutDescription: UILabel!
    
    @IBOutlet weak var vAboutImage: UIImageView!
    
    @IBOutlet weak var vAboutCopyright: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AboutVC.preferredFontChange), name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        title = "About"
        
        vAboutTitle.text = "MusicVideoFlo"
        vAboutDescription.text = "Lorem ipsum dolor sit amet, consecte turadipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n Duis aute irure dolor reprehenderit voluptate velit essecillum dolore eu fugiat nulla pariatur. \n Excepteur sint occaecat cupidatat non proident, sunt culpa qui officia deserunt mollit anim id est laborum."
        
        vAboutImage.image = UIImage(named: "dickbutt")
        
        vAboutCopyright.text = "Copyright © 2016 Dickbutt Inc. All rights reserved."
        
    }

    func preferredFontChange() {
        
        vAboutTitle.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        vAboutDescription.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        vAboutCopyright.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
    }

    
    // Is called just as the object is about to be dellocated
    deinit
    {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
}
