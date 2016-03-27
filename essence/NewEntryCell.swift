//
//  NewEntryCell.swift
//  essence
//
//  Created by martin chibwe on 3/26/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class NewEntryCell: UITableViewCell {

    
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Custom dynamic cell heights
    func getHeightForEntry(entry:Reflection) -> CGFloat {
        
        // Margins at top and bottom of table view cell
        let topMargin:CGFloat    = 35.0
        let bottomMargin:CGFloat = 80.0
        let minHeight:CGFloat    = 85.0
        
        // Get system font size, which is used to render the cell to the screen
        let font = UIFont.systemFontOfSize(UIFont.systemFontSize()) as UIFont
        
        // Calculate the bounding box by providing a maximum width and height in the form of CGSize, also provide attributes to providie such as font to draw the box with
        let boundingBox = entry.body!.boundingRectWithSize(CGSizeMake(202.0, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil) as CGRect
        
        // Return either the MAX of minimum height, or the CGRECT with the top and bottom margings
        return max(minHeight, (CGRectGetHeight(boundingBox) + topMargin + bottomMargin))
    }
    
    
    
    func configureCellForEntry(entry:Reflection) {
        
        // Day of the week, month, year format
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        
        // Create the new date object
        let date = NSDate(timeIntervalSince1970: entry.date)
        
        self.bodyLabel.text = entry.body
        self.locationLabel.text = entry.location
        self.timeLabel.text = formatter.stringFromDate(date)
        self.mainImage!.image = UIImage(named: "icn_noimage")
        
        if entry.imageData != nil{
            self.mainImage!.image = UIImage(data: entry.imageData!)
        }else{
            self.mainImage!.image = UIImage(named: "icn_noimage")
        }

        // Set the rounded edges - using Quartz framework - ensure clipsubviews is checked in storyboard to perform clipped, otherwise this will do nothing
        self.mainImage.layer.cornerRadius = CGRectGetWidth(self.mainImage.frame) / 2.0
        
        
    }


}
