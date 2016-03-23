//
//  MapViewController.swift
//  ProjectNorm
//
//  Created by David ODW on 23/03/2016.
//  Copyright © 2016 David Ong. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  let libraryAPI = LibraryAPI()
  
  @IBOutlet weak var mapView: MKMapView!
  
  var workshops = [Workshop]()
  var locations = [CLLocationCoordinate2D]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(false)
    
    locations = libraryAPI.getAllLocations()
    workshops = libraryAPI.getAllWorkshops()!
    print(locations)
    for i in 0..<locations.count {
      
      let annotation = MKPointAnnotation()
      annotation.coordinate = locations[i]
      print(locations[i])
      annotation.title = workshops[i].name
      mapView.addAnnotation(annotation)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}

extension MapViewController: MKMapViewDelegate {
  
}
