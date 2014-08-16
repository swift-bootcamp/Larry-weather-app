//
//  ViewController.swift
//  Weather
//
//  Created by lab506 on 2014/8/16.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var api: String = ""
    @IBOutlet weak var city: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.city.text = "Taipei"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

