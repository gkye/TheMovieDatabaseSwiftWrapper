//
//  ReviewMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct ReviewsMDB {
    public var id: String!
    public var author: String!
    public var content: String!
    public var iso_639_1: String!
    public var media_id: Double!
    public var media_title: String!
    public var url: String!
    public init(results: JSON) {
        id = results["id"].string
        author = results["author"].string
        content = results["content"].string
        iso_639_1 = results["iso_639_1"].string
        media_id = results["media_id"].double
        media_title = results["mediaTitle"].string
        url = results["url"].string
    }

    /// Get the full details of a review by ID.
    public static func review(reviewId: String!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ReviewsMDB?) -> Void) {
        Client.review(reviewId: reviewId) { apiReturn in
            var data: ReviewsMDB?
            if let json = apiReturn.json {
                data = ReviewsMDB(results: json)
            }
            completion(apiReturn, data)
        }
    }
}
