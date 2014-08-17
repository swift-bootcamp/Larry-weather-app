//
//  ViewController.swift
//  Weather
//
//  Created by lab506 on 2014/8/16.
//  Copyright (c) 2014年 Mango. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate {
    
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var rainRateIcon: UIImageView!
    
    @IBOutlet weak var rainRateLabel: UILabel!
    @IBOutlet weak var skyIcon: UIImageView!
    var data:NSMutableData = NSMutableData()
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    var tempKind:Int = 0
    var weatherTempCelsius:Int = 0
    var weatherTempFahrenheit:Int = 0

    
    @IBAction func switchTempKind(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            setTemp(0)
        case 1:
            setTemp(1)
        default:
            setTemp(0)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        icon.image = UIImage(named: "Weather-icon")
        icon.setNeedsDisplay()
        self.cityLabel.text = ""
        self.tempLabel.text = ""
        self.rainRateLabel.text = ""
        
        let singleFingerTap = UITapGestureRecognizer(target: self, action: "handleSingleTap:")
        self.view.addGestureRecognizer(singleFingerTap)

        //startConnect()
    }
    
    func handleSingleTap(recognizer:UITapGestureRecognizer){
        startConnect()
        let background = UIImage(named: "2011042154565430.jpg")
        self.view.backgroundColor = UIColor(patternImage: background)
        self.cityLabel.text = "Loading..."
        icon.image = UIImage(named: "rain.png")
        rainRateIcon.image = UIImage(named: "Humidity")
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
            //self.data.appendData(dataReceived)
            self.data.setData(dataReceived)
    }

    
    func connectionDidFinishLoading(connection:NSURLConnection!){
        println("download finish")
        self.cityLabel.text = "Taipei"
        var json = NSString(data:data, encoding:NSUTF8StringEncoding)
        
        var error:NSError?
        let jsonDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        let temp: AnyObject? = jsonDictionary["main"]?["temp"]
        let humidity: AnyObject? = jsonDictionary["main"]?["humidity"]
        
        if let weather = jsonDictionary["weather"]? as? NSArray{
            let weatherDictionary = (weather[0] as NSDictionary)
            let weatherId = weatherDictionary["id"] as Int?
            println("Weather ID:\(weatherId)")
            
            if weatherId==803
            {
                skyIcon.image = UIImage(named: "803")
                let background = UIImage(named: "cloud2.jpg")
                self.view.backgroundColor = UIColor(patternImage: background)
                
            }
            
        }
        
        
        
        weatherTempCelsius = Int(round((temp!.floatValue - 273.15)))
        weatherTempFahrenheit = Int(round(((temp!.floatValue - 273.15)*1.8)+32))
        let weatherHumidity = round(humidity!.floatValue)
        self.rainRateLabel.text = "\(weatherHumidity)%"
        if tempKind == 0 {
            setTemp(0)
        }
        else {
            setTemp(1)
        }
        
        
    }
    
    func setTemp(kind:Int)
    {
        if kind == 0 {
            self.tempLabel.text = "\(weatherTempCelsius)°C"
        }
        else {
            self.tempLabel.text = "\(weatherTempFahrenheit)°F"
        }
    }

}

