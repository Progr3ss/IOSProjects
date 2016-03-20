//
//  IdeaCell.swift
//  essence
//
//  Created by martin chibwe on 3/7/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class IdeaCell: UITableViewCell {

    
 
    @IBOutlet weak var imageColor: UIImageView!
    
    @IBOutlet weak var userInputLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var swipeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
