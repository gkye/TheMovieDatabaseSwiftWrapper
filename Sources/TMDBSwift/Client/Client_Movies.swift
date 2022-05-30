//
//  Client_Movies.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-16.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client {

    static func Movies(_ urlType: String!, page: Int?, language: String?, region: String? = nil, completion: @escaping (ClientReturn) -> Void) {

        var parameters: [String: AnyObject] = [:]

        if let pg = page {
            parameters["page"] = pg as AnyObject?
        }

        if language != nil {
            parameters["language"] = language as AnyObject?
        }

        if let reg = region {
            parameters["region"] = reg as AnyObject
        }

        let url = "https://api.themoviedb.org/3/movie/" + urlType
        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }

}
