//
//  FilterViewController.swift
//  ProjectNorm
//
//  Created by David ODW on 23/03/2016.
//  Copyright © 2016 David Ong. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
  let libraryAPI = LibraryAPI()
  
  var delegate:passWorkshopDataDelegate?
  
  @IBOutlet weak var tyreSwitch: UISwitch!
  @IBOutlet weak var oilSwitch: UISwitch!
  @IBOutlet weak var batterySwitch: UISwitch!
  
  @IBOutlet weak var stepLabel: UILabel!
  
  let step: Float = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func sliderValueChanged(sender: UISlider) {
    let roundedValue = round(sender.value / step) * step
    sender.value = roundedValue
    stepLabel.text = "\(Int(roundedValue))"
  }
  
  @IBAction func filterButtonIsClicked(sender: AnyObject) {
    var workshopsFilteredData = libraryAPI.getAllWorkshops()!
    
    if tyreSwitch.on {
      workshopsFilteredData = workshopsFilteredData.filter {
        $0.tyreChange == 1
      }
    }
    
    if oilSwitch.on {
      workshopsFilteredData = workshopsFilteredData.filter {
        $0.oilChange == 1
      }
    }
    
    if batterySwitch.on {
      workshopsFilteredData = workshopsFilteredData.filter {
        $0.batteryChange == 1
      }
    }
    
    workshopsFilteredData = workshopsFilteredData.filter {
      $0.rating == Int(stepLabel.text!)
    }
    
    delegate?.passWorkshopData(workshopsFilteredData)
    navigationController?.popViewControllerAnimated(false)
  }
}
