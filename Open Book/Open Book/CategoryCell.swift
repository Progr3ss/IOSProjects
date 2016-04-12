//
//  CategoryCell.swift
//  Open Book
//
//  Created by martin chibwe on 4/12/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
	
	
	
	
}

extension CategoryCell: UICollectionViewDataSource {
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print("asdfasdf")
		return 12
	}
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("bookCell", forIndexPath: indexPath)
		print("bookCewll")
		
		return cell
		
	}
	
	
	
	
}
