//
//  ReviewMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct ReviewsMDB: Decodable {
    public var id: String!
    public var author: String!
    public var content: String!
    public var iso_639_1: String!
    public var media_id: Double!
    public var media_title: String!
    public var url: String!

    /// Get the full details of a review by ID.
    public static func review(reviewId: String!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ReviewsMDB?) -> Void) {
        Client.review(reviewId: reviewId) { apiReturn in
            let data: ReviewsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }
}
