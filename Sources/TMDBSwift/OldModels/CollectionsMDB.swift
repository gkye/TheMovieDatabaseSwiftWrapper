//
//  Collection.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct CollectionMDB: Decodable {
    public var id: Int?
    public var name: String?
    public var poster_path: String?
    public var backdrop_path: String?
    public var overview: String?
    public var collectionItems: [MovieMDB]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case poster_path
        case backdrop_path
        case overview
        case collectionItems = "parts"
    }

    /// Get the basic collection information for a specific collection id.
    public static func collection(collectionId: Int!, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: CollectionMDB?) -> Void) {
        Client.Collection(collectionId: String(collectionId), language: language) { apiReturn in
            let data: CollectionMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get all of the images for a particular collection by collection id.
    public static func collectionImages(collectionId: Int!, language: String?, completion:  @escaping (_ clientReturn: ClientReturn, _ data: ImagesMDB?) -> Void) {
        Client.Collection(collectionId: String(collectionId) + "/images", language: language) { apiReturn in
            let data: ImagesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }
}
