//
//  Client_Reviews.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
extension Client {

    static func review(reviewId: String!, completion: @escaping (ClientReturn) -> Void) {
        let parameters: [String: AnyObject] = [:]
        let url = "https://api.themoviedb.org/3/review/"+reviewId

        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }
}
