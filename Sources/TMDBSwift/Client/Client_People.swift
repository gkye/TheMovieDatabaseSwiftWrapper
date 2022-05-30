//
//  Client_People.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client {

    static func Person(_ urlType: String!, language: String?, page: Int?, completion: @escaping (ClientReturn) -> Void) {
        let url = "https://api.themoviedb.org/3/person/" + urlType
        var parameters: [String: AnyObject] = [:]
        if language != nil { parameters["language"] = language as AnyObject? }
        if page != nil {parameters["page"] = page as AnyObject?}

        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }
}
