//
//  OpenBookStore.swift
//  Open Book
//
//  Created by martin chibwe on 4/12/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class OpenBookStore: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	var categories = ["History", "Philosophy", "Science Fiction", "Kids", "Horror"]
	
	
	func delay(seconds seconds: Double, completion:()->()) {
		let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
		dispatch_after(popTime, dispatch_get_main_queue()) {
			completion()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		delay(seconds: 1.0){
			self.tableView.reloadData()
		}

        // Do any additional setup after loading the view.
    }

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let videoCell = sender as? BookCell,
			let bookDetailPage = segue.destinationViewController as? BookDetail {
			let book = videoCell.book
			bookDetailPage.book = book

		}
	}
	


}

extension OpenBookStore: UITableViewDataSource{
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return categories.count
	}
	
	
	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return categories[section]
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? CategoryCell
	
		cell?.genre = Catalog.sharedInstance.genres[indexPath.section]
			
		
		return cell!
	}
	
}


