//
//  ViewController.swift
//  PokemonGo
//
//  Created by Piero Valentino Noa Chahuayo on 17/06/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var contActualizaciones = 0

    @IBOutlet weak var mapView: MKMapView!
    
    var ubicacion = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ubicacion.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapView.showsUserLocation = true
            ubicacion.startUpdatingLocation()
        }else{
            ubicacion.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if contActualizaciones < 1 {
            
            let region = MKCoordinateRegion.init(center: ubicacion.location!.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
            
        }else{
            ubicacion.stopUpdatingLocation()
        }
    }
}

