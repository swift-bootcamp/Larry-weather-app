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
    @IBOutlet weak var temp: UILabel!
    
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
            self.data.appendData(dataReceived)
    }

    
    func connectionDidFinishLoading(connection:NSURLConnection!){
        println("download finish")
        
        var json = NSString(data:data, encoding:NSUTF8StringEncoding)
        println(json)
        
        var error:NSError?
        let jsonDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        let temp: AnyObject? = jsonDictionary["main"]?["temp"]
        
        let weatherTempCelsius = Int(round((temp!.floatValue - 273.15)))
        let weatherTempFahrenheit = Int(round(((temp!.floatValue - 273.15)*1.8)+32))
        
        self.temp.text = "\(weatherTempCelsius)°C"
    }

}

