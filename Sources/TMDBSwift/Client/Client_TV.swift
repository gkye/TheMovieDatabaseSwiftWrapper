//
//  Client_TV.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client {
    static func TV(_ urlType: String!, page: Int?, language: String?, completion: @escaping (ClientReturn) -> Void) {

        var parameters: [String: AnyObject] = [:]
        if page != nil {
            parameters["page"] = page as AnyObject?
        }
        if language != nil {
            parameters["language"] = language as AnyObject?
        }

        let url = "https://api.themoviedb.org/3/tv/" + urlType
        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }
}
