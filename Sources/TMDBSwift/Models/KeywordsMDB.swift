//
//  KeywordsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

open class KeywordsMDB: ArrayObject {

    open var id: Int?
    open var name: String?

    required public init(results: JSON) {
        id = results["id"].int
        name = results["name"].string
    }

    /// Get the basic information for a specific keyword id.
    open class func keyword(keywordId: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: KeywordsMDB?) -> Void) {
        let url = "https://api.themoviedb.org/3/keyword/" + String(keywordId)
        Client.keyword(url) { apiReturn in
            var keywords: KeywordsMDB?
            if let json = apiReturn.json {
                keywords = KeywordsMDB(results: json)
            }
            completion(apiReturn, keywords)
        }
    }

    /// Get the list of movies for a particular keyword by id.
    open class func keyword_movies(keywordId: Int!, page: Int, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> Void) {
        let url = "https://api.themoviedb.org/3/keyword/" + String(keywordId) + "/movies"
        Client.keyword_movies(url, page: page, language: language) { apiReturn in
            var movies: [MovieMDB]?
            if let json = apiReturn.json?["results"] {
                movies = MovieMDB.initialize(json: json)
            }
            completion(apiReturn, movies)
        }
    }

}
