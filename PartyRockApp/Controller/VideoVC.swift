//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Руслан Акберов on 01.10.2017.
//  Copyright © 2017 Руслан Акберов. All rights reserved.
//

import UIKit
import WebKit

class VideoVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _partyRock: PartyRock!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
