//
//  CategoryCell.swift
//  Open Book
//
//  Created by martin chibwe on 4/12/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//





import UIKit

class CategoryCell: UITableViewCell {
	
//	 var books = [Book]()

	@IBOutlet weak var collectionView: UICollectionView!
	
	var genre: Genre? = nil {
		didSet{
			collectionView.reloadData()
		}
	}
	
}



extension CategoryCell : UICollectionViewDataSource {
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return genre!.books.count
	}
	
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BookCell", forIndexPath: indexPath) as! BookCell
		if let genre = genre {
			cell.book = genre.books[indexPath.row]
		}
		return cell
	}
	
}

extension CategoryCell : UICollectionViewDelegateFlowLayout {
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		let itemsPerRow:CGFloat = 5
		let hardCodedPadding:CGFloat = 5
		let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
		let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
		return CGSize(width: itemWidth, height: itemHeight)
	}
	
}






