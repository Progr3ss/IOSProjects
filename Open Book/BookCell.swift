//
//  BookCell.swift
//  Open Book
//
//  Created by martin chibwe on 4/22/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import AlamofireImage


class BookCell: UICollectionViewCell {
	
	
	@IBOutlet weak var imageView: UIImageView!
	
	
	
	var book:Books? = nil {
		didSet{
			if let book = book,
				let url = NSURL(string: book.coverImage){
				self.imageView.af_setImageWithURL(url)
			}
		}
	}
    
}
