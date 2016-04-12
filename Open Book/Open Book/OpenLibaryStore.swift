//
//  OpenLibaryStore.swift
//  Open Book
//
//  Created by martin chibwe on 4/12/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class OpenLibaryStore: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension OpenLibaryStore : UITableViewDataSource{
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
		
		return cell!
	}
	
	
	
}


extension CategoryCell : UICollectionViewDelegateFlowLayout {
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		let itemsPerRow:CGFloat = 3
		let hardCodedPadding:CGFloat = 5
		let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
		let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
		return CGSize(width: itemWidth, height: itemHeight)
	}
	
}