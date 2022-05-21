//
//  Client_Seasons.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
extension Client {
    static func Seasons(_ urlType: String!, language: String?, completion: @escaping (ClientReturn) -> Void) {
        var parameters: [String: AnyObject] = [:]
        if language != nil {
            parameters["language"] = language as AnyObject?
        }

        let url = "https://api.themoviedb.org/3/tv/" + urlType
        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }
}
