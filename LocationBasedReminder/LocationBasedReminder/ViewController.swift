//
//  ViewController.swift
//  LocationBasedReminder
//
//  Created by Akshit Saxena on 2/15/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager();
    //var coordArray = [String]()
    
    
    @IBAction func reminderButtonClicked(_ sender: Any) {
        
        
        let coord = locationManager.location?.coordinate
        
        if let lat = coord?.latitude, let long = coord?.longitude{
            let coordinateString = "Latitude: \(lat), Longitude: \(long)"
//            coordArray.append(coordinateString)
            DataStore().StoreDataPoint(latitude: String(lat), longitude: String(long))
//            print(coordinateString)
        }
        
        
//        print(coordArray)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else{
            print("Location not enabled")
            return
        }
        print("Location allowed")
        mapView.showsUserLocation = true
    }


}

