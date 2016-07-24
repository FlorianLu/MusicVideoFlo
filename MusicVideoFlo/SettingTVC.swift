//
//  SettingTVC.swift
//  MusicVideoFlo
//
//  Created by Florian LUDOT on 20/07/16.
//  Copyright © 2016 Florian LUDOT. All rights reserved.
//

import UIKit

class SettingTVC: UITableViewController {

    @IBOutlet weak var aboutDisplay: UILabel!
    
    @IBOutlet weak var feedBackDisplay: UILabel!
    
    @IBOutlet weak var securityDisplay: UILabel!
    
    @IBOutlet weak var touchID: UISwitch!
    
    @IBOutlet weak var bestImageDisplay: UILabel!
    
    @IBOutlet weak var APICnt: UILabel!
    
    @IBOutlet weak var numberMusicVideo: UILabel!
    
    @IBOutlet weak var dragSlider: UILabel!
    
    @IBOutlet weak var sliderCnt: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SettingTVC.preferredFontChange), name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        tableView.alwaysBounceVertical = false
        
        title = "Settings"
        
        touchID.on = NSUserDefaults.standardUserDefaults().boolForKey("SecSetting")
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("APICNT") != nil) {
            let theValue = NSUserDefaults.standardUserDefaults().objectForKey("APICNT") as! Int
            APICnt.text = ("\(theValue)")
            sliderCnt.value = Float(theValue)
        } else {
            sliderCnt.value = 10.0
            APICnt.text = ("\(Int(sliderCnt.value))")
        }
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(Int(sliderCnt.value), forKey: "APICNT")
        APICnt.text = ("\(Int(sliderCnt.value))")
    }
    
    @IBAction func toucheIdSec(sender: UISwitch) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if touchID.on {
            defaults.setBool(touchID.on, forKey: "SecSetting")
        } else {
            defaults.setBool(false, forKey: "SecSetting")
        }
    }
    
    
    func preferredFontChange() {
        
        aboutDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        feedBackDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        securityDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        bestImageDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        numberMusicVideo.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        dragSlider.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        APICnt.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }
    
    // Is called just as the object is about to be dellocated
    deinit
    {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

}
