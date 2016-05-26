//
//  ViewController.swift
//  Swift weather
//
//  Created by yx on 16/5/25.
//  Copyright © 2016年 yx. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    let locaionManager:CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locaionManager.delegate = self
        //精度设置
        locaionManager.desiredAccuracy = kCLLocationAccuracyBest
        
//        if(ios8()){
//            locaionManager.requestAlwaysAuthorization()
//        }
        locaionManager.requestAlwaysAuthorization()

        locaionManager.startUpdatingLocation()
    }
    
    func ios8 () -> Bool{
        return UIDevice.currentDevice().systemVersion == "8.0"
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location:CLLocation = locations[locations.count-1] as CLLocation
        if(location.horizontalAccuracy > 0){
            print(location.coordinate.latitude)
             print(location.coordinate.longitude)
            locaionManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print(error)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

