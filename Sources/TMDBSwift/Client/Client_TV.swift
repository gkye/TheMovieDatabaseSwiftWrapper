//
//  Client_TV.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client {
    static func TV(_ urlType: String!, page: Int?, language: String?, timezone: String?, append_to: [String]? = nil, completion: @escaping (ClientReturn) -> Void) {

        var parameters: [String: AnyObject] = [:]
        if page != nil {
            parameters["page"] = page as AnyObject?
        }
        if language != nil {
            parameters["language"] = language as AnyObject?
        }
        if timezone != nil {
            parameters["timezone"] = timezone as AnyObject?
        }
        if append_to != nil {
            parameters["append_to_response"] = append_to?.joined(separator: ",") as AnyObject?
        }

        let url = "https://api.themoviedb.org/3/tv/" + urlType
        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }
}
