//
//  Catalog .swift
//  Open Book
//
//  Created by martin chibwe on 4/21/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//
//
class Catalog {
	static let sharedInstance = Catalog()
	let genres:[Genre]
	
	init(){
		
		//Philosophy
		let history = Books(name:"history" )
		let historyG = Genre(name: "History",books: [history])
		
		//Science Fiction
		let scienceFiction = Books(name:"science fiction" )
		let scienceFictionG = Genre(name: "Science Fiction",books: [scienceFiction])
		//Fiction
		let fiction = Books(name:"fiction" )
		let fictionG = Genre(name: "Fiction",books: [fiction])
		//Drama
		let drama = Books(name:"drama" )
		let dramaG = Genre(name: "Drama",books: [drama])
		
		
		genres = [historyG, scienceFictionG,fictionG,dramaG]
		
		
	}
	

}