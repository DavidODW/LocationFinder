//
//  Workshop.swift
//  ProjectNorm
//
//  Created by David ODW on 23/03/2016.
//  Copyright © 2016 David Ong. All rights reserved.
//

import UIKit
import Gloss

public struct Workshop: Decodable {
  public let name: String!
  public let coordinates: String!
  public let tyreChange: Int!
  public let oilChange: Int!
  public let batteryChange: Int!
  public let rating: Int!
  
  public init?(json: JSON) {
    name = "WorkshopName" <~~ json
    coordinates = "WorkshopCoordinates" <~~ json
    tyreChange = "TyreChange" <~~ json
    oilChange = "OilChange" <~~ json
    batteryChange = "BatteryChange" <~~ json
    rating = "CustomerRating" <~~ json
  }
}
