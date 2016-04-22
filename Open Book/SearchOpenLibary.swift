//
//  SearchOpenLibary.swift
//  Open Book
//
//  Created by martin chibwe on 4/18/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class SearchOpenLibary: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	var inSearchMode = false
	var books = [Books]()
    override func viewDidLoad() {
        super.viewDidLoad()
		
		
		Alamofire.request(.GET, "https://openlibrary.org/search.json?q=the+lord+of+the+rings").validate().responseJSON { response in
			switch response.result {
			case .Success:
				if let value = response.result.value {
					let json = JSON(value)
					print("JSON: \(json)")
				}
			case .Failure(let error):
				print(error)
				print("Fuck off")
			}
		}
		
		
		searchBar.delegate = self

        // Do any additional setup after loading the view.
    }

}


extension SearchOpenLibary: UISearchBarDelegate {
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		
		print("in search ")
		
		if searchBar.text == nil {
			
			print("search  d")
			print("Search \(searchBar.text)")
			
			//            searchURL = "\(Constants.WebURL.BASE_URL)\(Constants.WebURL.SEARCH_URL)\(searchBar.text)"
			print("search  \(searchBar)")
			inSearchMode = false
			view.endEditing(true)
			//			CollectionView.reloadData()
		}
		else {
			print("in search mode")
			inSearchMode = true
			let lower = searchBar.text!.lowercaseString
			print("lower \(lower)")
			//            searchURL = "\(Constants.WebURL.BASE_URL)\(Constants.WebURL.SEARCH_URL)\(lower)"
//			getBooks(lower)
			//            print("\(SearchBar) searsadjfasdkljfaskl sd")
			//			CollectionView.reloadData()
		}
		
		func searchBarSearchButtonClicked(searchBar: UISearchBar) {
			//            view.endEditing(true)
			
			print("Cliked")
		}
		
	
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//		print("in search ")
//		
//		if searchBar.text == nil {
//			
//			print("search  d")
//			print("Search \(searchBar.text)")
//			
//			//            searchURL = "\(Constants.WebURL.BASE_URL)\(Constants.WebURL.SEARCH_URL)\(searchBar.text)"
//			print("search  \(searchBar)")
//			inSearchMode = false
//			view.endEditing(true)
////			CollectionView.reloadData()
//		}
//		else {
//			print("in search mode")
//			inSearchMode = true
//			let lower = searchBar.text!.lowercaseString
//			print("lower \(lower)")
//			//            searchURL = "\(Constants.WebURL.BASE_URL)\(Constants.WebURL.SEARCH_URL)\(lower)"
//			getBooks(lower)
//			//            print("\(SearchBar) searsadjfasdkljfaskl sd")
////			CollectionView.reloadData()
//		}
//		
//		func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//			//            view.endEditing(true)
//			
//			print("Cliked")
//		}
	}
}

//extension SearchOpenLibary {
//	
//	
//	private func getBooks(searchTerm:String) {
//		
//		let search = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+")
//		let request = NSURLRequest(URL: NSURL(string: "\(Constants.WebURL.BASE_URL)\(Constants.WebURL.SEARCH_URL)\(search)")!)
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
////					self.CollectionView.reloadData()
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
//				let book = Book()
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
//				book.bookTitle = title
//				book.autherName = author[0]
//				book.bookLinkUrl = ("\(Constants.WebURL.BASE_URL)/api/volumes/brief/lccn/\(keyBookUrl[0]).json")   //http://openlibrary.org/api/volumes/brief/lccn/82205009.json
//				
//				if ((value["cover_i"]) != nil) {
//					
//					if let imageTest = value["cover_i"]! as? Int {
//						//https://covers.openlibrary.org/b/id/
//						book.urlCover = "https://covers.openlibrary.org/b/id/\(imageTest)-M.jpg"; //Med
//						//                        book.urlCover = "https://covers.openlibrary.org/b/id/\(imageTest)-S.jpg"; //Small
//						
//					}
//					else {
//						
//						book.urlCover = "";
//					}
//				}
//				else {
//					
//					book.urlCover = "";
//					print("Found nil Sorry")
//				}
//				books.append(book)
//			}
//		}
//
//	}
//}
