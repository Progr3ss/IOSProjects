//
//  Genre.swift
//  Open Book
//
//  Created by martin chibwe on 4/21/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import Foundation

class Genre {
	let name:String
	let books:[Books]
	
	init(name: String, books: [Books]){
		self.name = name
		self.books = books
	}
	

}