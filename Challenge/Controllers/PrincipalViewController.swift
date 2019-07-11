//
//  ViewController.swift
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/9/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

import UIKit
import MapKit

class PrincipalViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var poiMap: MKMapView!
    var vehicles: [Vehicle] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setMapConfiguration()
        getVehiclesRequest()
    }
    
    // MARK: - Register Custom Cell to principal TableView
    func registerCells() {
        listTableView.register(PrincipalTableViewCell.nib(), forCellReuseIdentifier: ViewIdentifier.principalCell)
    }
    
    // MARK: - Call endpoint to get all services on defined Bound
    private func getVehiclesRequest() {
        let serviceManager = Services.shared
        serviceManager.delegate = self
        let bound = Bound(northernmosCoordinate: CLLocationCoordinate2D(latitude: kNorthernmost, longitude: kWestermost), southernmostCoordinate: CLLocationCoordinate2D(latitude: kSouthernmost, longitude: kEasternmost))
        serviceManager.getVehiclesWithBound(bound)
    }
    
    // MARK: - Set Region and configure map attributes
    private func setMapConfiguration() {
        let region = MKCoordinateRegion(center: MapManager.centerInBound(), latitudinalMeters: MapManager.latitudinalMeters(kWestermost, easternmostLat: kEasternmost), longitudinalMeters: MapManager.longitudinalMeters(kNorthernmost, southernmostLng: kSouthernmost))
        poiMap.setRegion(region, animated: false)
    }
    
    @IBAction func togglePresentation(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            listTableView.isHidden = true
            poiMap.isHidden = false
        case 1:
            listTableView.isHidden = false
            poiMap.isHidden = true
        default:
            break;
        }
    }
    
    // MARK: - Draw Vehicles on Map
    private func drawPoints() {
        for vehicle in vehicles {
            let info2 = CustomPointAnnotation()
            info2.coordinate = CLLocationCoordinate2DMake(vehicle.coordinate.latitude, vehicle.coordinate.longitude)
            info2.title = "\(vehicle.id)"
            info2.index = Int32(vehicle.id)
            info2.imageName = "taxi"
            poiMap.addAnnotation(info2)
        }
    }
}

extension PrincipalViewController: MKMapViewDelegate {
    
    // MARK: - Annotation View Design
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CustomPointAnnotation else {
            return nil
        }
        
        let reuseId = "reuseIdentifier"
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
        } else {
            anView!.annotation = annotation
        }
        anView!.image = UIImage(named: annotation.imageName as String)
        anView!.tag = Int(annotation.index)
        return anView
    }
}

extension PrincipalViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifier.principalCell) as! PrincipalTableViewCell
        let vehicle = vehicles[indexPath.row]
        cell.titleLabel.text = vehicle.type + " \(vehicle.id)"
        cell.stateLabel.text = vehicle.state
        return cell
    }
}

extension PrincipalViewController: ServiceResponse {
    func didCompleteRequestWithResponse(_ response: Any?, request: Int) {
        /// TODO: Include switch to identify request number
        guard let data = response as? [String: Any], let poiList = data["poiList"] as? [Any] else {
            return
        }
        
        vehicles = Mapper.decodeWithDataArray(poiList)
        listTableView.reloadData()
        drawPoints()
    }
    
    func didCompleteRequestWithError(_ error: Error, request: Int) {
        /// TODO: Include banner notification
        print(error)
    }
}
