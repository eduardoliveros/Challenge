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
        
        let region = MKCoordinateRegion(center: MapManager.center(), latitudinalMeters: MapManager.latitudinalMeters(), longitudinalMeters: MapManager.longitudinalMeters())
        poiMap.setRegion(region, animated: false)
        let serviceManager = Services.shared
        serviceManager.delegate = self
        serviceManager.getVehicles()
        // Do any additional setup after loading the view.
    }
    
    func registerCells() {
        listTableView.register(PrincipalTableViewCell.nib(), forCellReuseIdentifier: ViewIdentifier.principalCell)
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
    
    func drawPoints() {
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

extension PrincipalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifier.principalCell) as! PrincipalTableViewCell
        cell.labelId.text = "\(vehicles[indexPath.row].id)"
        return cell
    }
}

extension PrincipalViewController: UITableViewDelegate {
    
}

extension PrincipalViewController: ServiceResponse {
    func didCompleteRequestWithResponse(_ response: Any?, request: Int) {
        guard let data = response as? [String: Any], let poiList = data["poiList"] as? [Any] else {
            return
        }
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        do {
            let dataNew = try Data(JSONSerialization.data(withJSONObject: poiList, options: .sortedKeys))
            let list: [Vehicle] = try! decoder.decode([Vehicle].self, from: dataNew)
            vehicles = list
            listTableView.reloadData()
            drawPoints()
        } catch {
            print(error)
        }
    }
    
    func didCompleteRequestWithError(_ error: Error, request: Int) {
        
    }
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let id: Int
    let coordinate: VehicleCoordinate
    let state, type: String
    let heading: Double
}

// MARK: - Coordinate
struct VehicleCoordinate: Codable {
    let latitude, longitude: Double
}
