//
//  ViewController.swift
//  Weather
//
//  Created by Matt Lashinsky on 10/11/15.
//  Copyright © 2015 MattL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cityEntered = String()
    var validCity = String()
    
    @IBOutlet var cityField: UITextField!
    
   
    @IBAction func buttonClick(sender: AnyObject) {
        
        if cityField != nil {
            
            cityEntered = String(cityField.text!)
            
            let cityArray = cityEntered.componentsSeparatedByString(" ")
            
            if cityArray.count > 1 {
                
                for x in cityArray {
                    
                    validCity += x
                }
            }
            
            print(validCity)
        }
        
        let cityString = "http://www.weather-forecast.com/locations/" + validCity.lowercaseString + "/forecasts/latest"
        
        let url = NSURL(string: cityString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (dataCopy , response, error ) -> Void in
            //code here:
            if dataCopy != nil {
                
                let webContent = NSString(data: dataCopy!, encoding: NSUTF8StringEncoding)
                
//                print(webContent)
                
                let webContentString = NSString(string: webContent!)

                if webContentString.containsString("1 – 3 Day Weather"){
                    print("seems to be finding the 1-3 Day summary")
                } else {
                    print("not finding the 1-3 day summary, HOE!")
                }
                
            } else {
                print("dataCopy variable is empty")
            }
        }
        
        print(cityString)
        
        task.resume()
    }

    @IBOutlet var textField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

