//
//  Client_Credits.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-07.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client {

    static func Credits(creditID: String, completion: @escaping (ClientReturn) -> Void) {
        let parameters: [String: AnyObject] = [:]
        let url = "https://api.themoviedb.org/3/credit/" + creditID
        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }
}
