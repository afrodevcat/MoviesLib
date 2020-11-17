//
//  MapViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 16/11/20.
//  Copyright © 2020 Afrodev. All rights reserved.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    let locationManager = CLLocationManager()
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        requestAuthorization()
    }
    
    //Fazendo teclado sumir ao clicar em área em branco da tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Methods
    private func setupView() {
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.delegate = self
        searchBar.delegate = self
    }
    
    private func requestAuthorization() {
        
        /*
        switch CLLocationManager.authorizationStatus() {
        case .denied:
            print("Usuário já negou")
        case .authorizedAlways, .authorizedWhenInUse:
            print("Usuário autorizou")
        case .notDetermined:
            print("Usuário ainda não viu o alerta")
        case .restricted:
            print("Device com restrições")
        }
        */
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: - IBActions
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Selecionei a annotation cujo título é:", view.annotation?.title ?? "--")
    }
}

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        //Forma 2 mais geral
        //view.endEditing(true)
        
        let request = MKLocalSearch.Request()
        request.region = mapView.region
        request.naturalLanguageQuery = searchBar.text
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if error == nil {
                guard let response = response else {return}
                
                self.mapView.removeAnnotations(self.mapView.annotations)
                for item in response.mapItems {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    annotation.subtitle = item.url?.absoluteString
                    self.mapView.addAnnotation(annotation)
                }
                self.mapView.showAnnotations(self.mapView.annotations, animated: true)
            }
        }
        
    }
}
