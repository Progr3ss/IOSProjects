//
//  Constants.swift
//  Open Book
//
//  Created by martin chibwe on 4/17/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//



/*
Contains URls for the books
*/


import Foundation


struct Constants {
	
	struct WebURL {
		
		//        let test = "\(Constants.WebURL.BASE_URL)\(Constants.WebURL.SEARCH_URL)"
		static let APIScheme = "https"
		static let APIHost = "openlibrary.org"
		static let APIPath = "search.json?q="
		
		static let BASE_URL = "https://openlibrary.org"
		static let SEARCH_URL = "/search.json?q="
		static let SEARCH_TILE = ""
		static let SEARCH_PAGE = "&page="
		static let SEARCH_SUBJECTS = "subjects/"
		static let SUBJECT_SEARCH = ""
		static let SUBJECT_JSON = ".json"
		
		
		
		
	}
	
	struct Book {
		static let documentation = "docs"
		static let bib_key = "bib_key"
		static let info_url = "info_url"
		static let preview = "preview"
		static let preview_url = "preview_url"
		static let thumbnail_url = "thumbnail_url"
		static let urlBook = ""
		static let authors = "authors"
		static let title = "title"
		static let description = "description"
		static let identifiers = "identifiers"
		static let subject = "subjects"
		static let publishers = "publishers"
		static let ISBN = "ISBN"
		static let ISBN_LOW_CASE = "isbn"
		static let linkBook = ""
		static let cover = "cover_i"
		static let details = "details"
		static let number_of_pages = "number_of_pages"
		static let table_of_content = "table_of_contents"
		static let docs = "docs"
		static let title_suggest = "title_suggest"
		static let author_name = "author_name"
		static let first_publish_year = "first_publish_year"
		static let publish_year  = "publish_year"
		static let publish_date = "publish_date"
		static let key  =  "key"
		static let name = "name"
		static let subject_type = "subject_type"
		static let places = "places"
		static let tiems = "times"
		static let publishing_history = "publishing_history"
		static let works = "works"
		
		
		
	}
	
	struct Cover {
		
		static let mediumCoverISBN = "https://covers.openlibrary.org/b/isbn/"
		static let mediumCoverID =   "https://covers.openlibrary.org/b/id/"
		static let mediumCoverImg = "-M.jpg"
		
		
	}
	
	
	struct List {
		
		
	}
	struct Read {
		
	}
	
	struct Search {
		static let searchByTitle = "/search.json?title="
		
	}
	struct SearchInsideBook {
		
	}
	
	struct Subject {
		
		static let History = "history.json?details=true"
		static let Philosophy = "philosophy.json?details=true"
		static let ScienceFiction = "subjects/science_fiction.json?details=true"
		static let Fiction = "subjects/fiction.json?details=true"
		static let Romance = "subjects/romance.json?details=true"
		static let Drama = "subjects/drama.json?details=true"
	
		
		
	}
	
	
	
	
	
}