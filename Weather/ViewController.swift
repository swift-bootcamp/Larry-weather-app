//
//  ViewController.swift
//  Weather
//
//  Created by lab506 on 2014/8/16.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate {
    
    
    @IBOutlet var city: UILabel!
    @IBOutlet weak var icon: UIImageView!
    var data:NSMutableData = NSMutableData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let background = UIImage(named: "2011042154565430.jpg")
        self.view.backgroundColor = UIColor(patternImage: background)
        self.city.text = "Taipei"
        icon.image = UIImage(named: "rain.png")
        
        startConnect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startConnect(){
        var restAPI: String = "http://api.openweathermap.org/data/2.5/weather?q=Taipei"
        var url:NSURL = NSURL(string: restAPI);
        var request:NSURLRequest = NSURLRequest(URL:url)
        var connection:NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        println("start download")
    }
    
    func connection(connection: NSURLConnection!, didReceiveData dataReceived:NSData!){
            println("downloading")
            //println(dataReceived)
            self.data.appendData(dataReceived)
    }

    
    func connectionDidFinishLoading(connection:NSURLConnection!){
        println("download finish")
    }

}

