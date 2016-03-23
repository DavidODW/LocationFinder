//
//  WorkshopTableViewCell.swift
//  ProjectNorm
//
//  Created by David ODW on 23/03/2016.
//  Copyright © 2016 David Ong. All rights reserved.
//

import UIKit

class WorkshopTableViewCell: UITableViewCell {
  @IBOutlet weak var workshopName: UILabel!
  @IBOutlet weak var workshopRating: UILabel!
  @IBOutlet weak var workshopServices: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
