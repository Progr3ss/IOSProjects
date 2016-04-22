//
//  Book.swift
//  Open Book
//
//  Created by martin chibwe on 4/17/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//



/*

currently contains getter and setters
*/



import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class Books
{
	private var _autherName: String!
	private var _bookTitle: String!
	private var _coverImage: String!
	private var _urlCover: String!
	private var _bookSearchURl:String!
	private var _bookLinkUrl:String!
	
	
	
	
	
	//
	
	//
	//
	private func getBooks() {
		
		
		Alamofire.request(.GET, Constants.WebURL.BASE_URL).validate().responseJSON { response in
			switch response.result {
			case .Success:
				if let value = response.result.value {
					let json = JSON(value)
					print("JSON: \(json)")
				}
			case .Failure(let error):
				print(error)
			}
		}
		
		
	}
	
	
	
	init(name:String)
	{
		self._autherName = name
		self._coverImage = ""
		getBooks()
		
	}
	
	
	var coverImage: String {
		
		get {
			return _coverImage
		}
		set {
			self._coverImage = newValue
		}
	}
}

//		let request = NSURLRequest(URL: NSURL(string: "\(Constants.WebURL.BASE_URL)\(Constants.WebURL.BASE_URL)\(Constants.Subject.History)")!)

//		let urlSession = NSURLSession.sharedSession()
//		let task = urlSession.dataTaskWithRequest(request)

//		{(data, response,error) -> Void in
//
//
//			if error =
//
//
//		}
//

//
//
//		let request = NSURLRequest(URL: NSURL(string: "\(Constants.WebURL.BASE_URL)\(Constants.WebURL.BASE_URL)\(Constants.Subject.History)")!)
//
//		let urlSession = NSURLSession.sharedSession()
//
//		let task = urlSession.dataTaskWithRequest(request)
//		{(data, response, error) -> Void in
//
//
//			if error == nil {
//
//				guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode
//					where statusCode >= 200 && statusCode <= 299 else {
//						print("Failed  statusCode")
//
//						return
//				}
//
//				guard let data = data else {
//					print("No Data was returned by the request")
//
//					return
//				}
//
//				performUIUpdatesOnMain() {
//
//					self.parseJsonData(data)
//					//					self.CollectionView.reloadData()
//				}
//				//                     self.parseJsonData(data)
//			}
//		}
//		task.resume()
//	}
//
//
//	func parseJsonData(data: NSData) {
//
//		//        var books = [Book]()
//		do {
//			let jsonResult = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! [String:AnyObject]
//
//			guard let bookDictionary = jsonResult[Constants.Book.documentation] as? [[String:AnyObject]] else {
//				print("Cound not find key \(Constants.Book.documentation)")
//
//				return
//			}
//			for (key, value) in bookDictionary.enumerate() {
//
////				let book = Book(name: _bookTitle)
//				guard let title = value[Constants.Book.title] as? String else {
//
//					print("Could not find key \(Constants.Book.title)");
//					return
//				}
//
//				guard let author = value["author_name"] as? [String] else {
//
//					print("could not find key author_name");
//					return
//				}
//
//				guard let title_suggust = value["title_suggest"] as? String else {
//
//					print("Could not find key ");
//					return
//				}
//
//				guard let keyBookUrl = value["lccn"] as? [String] else {
//
//					print("Could not find key book link");
//					return
//				}
//				print(value);
//
////				book.bookTitle = title
////				book.autherName = author[0]
////				book.bookLinkUrl = ("\(Constants.WebURL.BASE_URL)/api/volumes/brief/lccn/\(keyBookUrl[0]).json")   //http://openlibrary.org/api/volumes/brief/lccn/82205009.json
////
////				if ((value["cover_i"]) != nil) {
////
////					if let imageTest = value["cover_i"]! as? Int {
////						//https://covers.openlibrary.org/b/id/
////						book.urlCover = "https://covers.openlibrary.org/b/id/\(imageTest)-M.jpg"; //Med
////						//                        book.urlCover = "https://covers.openlibrary.org/b/id/\(imageTest)-S.jpg"; //Small
////
////					}
////					else {
////
////						book.urlCover = "";
////					}
////				}
////				else {
////
////					book.urlCover = "";
////					print("Found nil Sorry")
////				}
////				//					books.append(book)
////			}
//		}
//
//	}
//
//
//
//
//
//
//
//	init(name:String, title:String) {
//		self._autherName = name
//		self._bookTitle = title
//		self._coverImage = ""
//
//	}
//
//
//
//
//	var bookLinkUrl: String {
//		get{
//			return _bookLinkUrl
//		}
//		set{
//			self._bookLinkUrl = newValue
//		}
//	}
//
//	var urlCover: String {
//		get{
//			return _urlCover
//		}
//		set{
//			self._urlCover = newValue
//		}
//	}
//
//	var autherName: String{
//
//		get {
//			return _autherName
//		}
//		set {
//			self._autherName = newValue
//		}
//	}
//
//	var bookTitle: String {
//
//		get{
//			return _bookTitle
//		}
//		set{
//			self._bookTitle = newValue.uppercaseString
//		}
//	}
//

//}
