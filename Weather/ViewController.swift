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
    var url: String="http://opendata.cwb.gov.tw/opendata/DIV2/O-A0001-001.xml"
    @IBOutlet var city: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.city.text = "Taipei"
        icon.image = UIImage(named: "rain.png")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

