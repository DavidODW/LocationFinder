//
//  ViewController.swift
//  ProjectNorm
//
//  Created by David ODW on 23/03/2016.
//  Copyright © 2016 David Ong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var workshopTableView: UITableView!
  
  let libraryAPI = LibraryAPI()
  var workshop : [Workshop]?
  var isReady : Bool = false

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.workshop = self.libraryAPI.getAllWorkshops()
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "processWorkshopItem:", name: "WorkshopsDataUpdate", object: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func processWorkshopItem(notification: NSNotification?) {
    dispatch_async(dispatch_get_main_queue(), {
      self.isReady = true
      self.workshop = self.libraryAPI.getAllWorkshops()
    
      self.workshopTableView.reloadData()
    })
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "FilterSegueIdentifier" {
      let destinationController = segue.destinationViewController as! FilterViewController
      destinationController.delegate = self
    }
  }
}

extension ViewController: passWorkshopDataDelegate {
  func passWorkshopData(toValue: [Workshop]) {
    self.workshop = toValue
    self.workshopTableView.reloadData()
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return workshop!.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("WorkshopCellIdentifier") as! WorkshopTableViewCell
    if isReady {
      cell.workshopName.text = workshop![indexPath.row].name
      cell.workshopRating.text = "Rating: \(workshop![indexPath.row].rating)"
      
      var services:String = "Services: ["
      if workshop![indexPath.row].tyreChange == 1 {
        services = services + " tyres "
      }
      if workshop![indexPath.row].oilChange == 1 {
        services = services + " oil "
      }
      if workshop![indexPath.row].batteryChange == 1 {
        services = services + " battery "
      }
      
      cell.workshopServices.text = services + "]"
    }
    
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 90
  }
}
