//
//  ListMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct ListsMDB: Decodable {

    public var created_by: String!
    public var description: String?
    public var favorite_count: Int!
    public var id: String!
    public var items = [MovieMDB]()
    public var item_count: Int!
    public var iso_639_1: String!
    public var name: String!
    public var poster_path: String?

    // MARK: Lists
    public  static func lists(listId: String!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ListsMDB?) -> Void) {
        let url  = "https://api.themoviedb.org/3/list/" + listId
        Client.Lists(url, listId: listId!) { apiReturn in
            let data: ListsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }

    }
}
