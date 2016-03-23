//
//  LibraryAPI.swift
//  ProjectNorm
//
//  Created by David ODW on 23/03/2016.
//  Copyright © 2016 David Ong. All rights reserved.
//

import UIKit
import MapKit

class LibraryAPI: NSObject {
  class var sharedInstance: LibraryAPI {
    struct Singleton {
      static let instance = LibraryAPI()
    }
    
    return Singleton.instance
  }

  private let workshopManager: WorkshopManager
  
  override init() {
    workshopManager = WorkshopManager()
  }
  
  func getAllWorkshops() -> [Workshop]? {
    return workshopManager.getWorkshops()
  }
  
  func getAllLocations() -> [CLLocationCoordinate2D] {
    return workshopManager.getAllLocation()!
  }
}
