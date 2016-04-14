//
//  configureCellForEntry.swift
//  essenece
//
//  Created by martin chibwe on 4/12/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class ConfigureCellForEntry: UITableViewCell {

	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var bodyLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configureCellForEntry(entry:EntityReflection) {
		
		// Day of the week, month, year format
		let formatter = NSDateFormatter()
		formatter.dateFormat = "MMMM dd yyyy"
		
		// Create the new date object
		let date = NSDate(timeIntervalSince1970: entry.date)
		
		self.bodyLabel.text = entry.body
		self.locationLabel.text = entry.location
		self.dateLabel.text = formatter.stringFromDate(date)
		

		
	}
	
	
//	func configureCellForEntry(entry:EntityReflection) {
//
//		// Day of the week, month, year format
//		let formatter = NSDateFormatter()
//		formatter.dateFormat = "MMMM dd yyyy"
//		
//		// Create the new date object
//		let date = NSDate(timeIntervalSince1970: entry.date)
////		
////		self.bodyLabel.text = entry.body
////		self.locationLabel.text = entry.location
////		self.timeLabel.text = formatter.stringFromDate(date)
////		self.mainImage!.image = UIImage(named: "icn_noimage")
////		
////		if entry.imageData != nil{
////			self.mainImage!.image = UIImage(data: entry.imageData!)
////		}else{
////			self.mainImage!.image = UIImage(named: "icn_noimage")
////		}
////		
////		// Set the rounded edges - using Quartz framework - ensure clipsubviews is checked in storyboard to perform clipped, otherwise this will do nothing
////		self.mainImage.layer.cornerRadius = CGRectGetWidth(self.mainImage.frame) / 2.0
//		
//		
//	}

}
