//
//  BookDetail.swift
//  Open Book
//
//  Created by martin chibwe on 4/22/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class BookDetail: UIViewController {
	
	 var book:Books? = nil

	@IBOutlet weak var imageView: UIImageView!
	
	
	@IBOutlet weak var authorName: UILabel!
	
	@IBOutlet weak var descriptionView: UILabel!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
