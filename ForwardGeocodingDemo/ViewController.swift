//
//  ViewController.swift
//  ForwardGeocodingDemo
//
//  Created by Sunny NG on 26/2/2017.
//  Copyright © 2017 Sunny NG. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var labelLatLng: UILabel!
    

    @IBAction func doForwardGeocoding(_ sender: Any) {
        let address = addressTextField.text!
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) in
            if error != nil {
                self.labelLatLng.text = "Error: " + error!.localizedDescription
            }
            else if placemarks!.count == 0 {
                self.labelLatLng.text = "Can't found a match"
            }
            else if placemarks!.count > 0 {
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
                self.labelLatLng.text = "lat:\(coords.latitude), lng:\(coords.longitude)"
                
                
            }
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

