//
//  Client_Genres.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client {
    static func Genres(listType: String, language: String?, genreId: Int, include_all_movies: Bool?, movieList: Bool?, completion: @escaping (ClientReturn) -> Void) {
        var parameters: [String: AnyObject] = [:]
        var url = ""
        if movieList == false || movieList == nil {
            url = "https://api.themoviedb.org/3/genre/" + listType + "/list"
        } else {
            url = "https://api.themoviedb.org/3/genre/" + String(genreId) + "/movies"
        }

        if language != nil {
            parameters["language"] = language as AnyObject?
        }

        if include_all_movies != nil {
            parameters["include_all_movies"] = include_all_movies as AnyObject?
        }

        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }
}
