//
//  ViewController.swift
//  Flashlight-improved
//
//  Created by Student on 4/6/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var OnOffLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        OnOffLabel.textColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func flashlightSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = UIColor.white
            OnOffLabel.textColor = UIColor.black
        }
        else{
            self.view.backgroundColor = UIColor.black
            OnOffLabel.textColor = UIColor.white
        }
        
        
    }
    
    


}

