//
//  ViewController.swift
//  WordCollage
//
//  Created by Student on 4/6/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GreenButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.green
    }
    
    @IBAction func BlueButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.blue
    }


}

