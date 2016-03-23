//
//  WorkshopManager.swift
//  ProjectNorm
//
//  Created by David ODW on 23/03/2016.
//  Copyright © 2016 David Ong. All rights reserved.
//

import UIKit
import Alamofire
import MapKit

class WorkshopManager: NSObject {
  var workshops = [Workshop]()
  
  let url: String = "https://dl.dropboxusercontent.com/u/2014613/workshop/workshops"
  
  override init() {
    super.init()
    
    requestWorkshopData()
  }
  
  func requestWorkshopData() {
    Alamofire.request(.GET, url)
      .responseJSON { response in
      
        switch response.result {
        case .Success:
          if let data = response.data {
            var json: [[String: AnyObject]]
            
            do {
              json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as! [[String: AnyObject]]
              
              for workshopEntity in json {
                self.workshops.append(Workshop(json: workshopEntity)!)
              }

              let notification = NSNotification(name: "WorkshopsDataUpdate", object: nil)
              NSNotificationCenter.defaultCenter().postNotification(notification)
            } catch {
              print(error)
              return
            }
            
          }
          
        case .Failure:
          print("Failed to retrieve the json data")
        }
    }
  }
  
  func getWorkshops() -> [Workshop]? {
    return workshops
  }
  
  func getAllLocation() -> [CLLocationCoordinate2D]? {
    var locations: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
    
    for workshop in workshops {
      let location = workshop.coordinates.componentsSeparatedByString(",")
      locations.append(CLLocationCoordinate2D(latitude: Double((location[1] as NSString).doubleValue), longitude: Double((location[0] as NSString).doubleValue)))
    }
    
    return locations
  }
}
