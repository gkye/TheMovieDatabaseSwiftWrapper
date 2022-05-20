//
//  NetworksMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct NetworksMDB: Codable {

    public var id: Double!
    public var name: String!

    /// This method is used to retrieve the basic information about a TV network. You can use this ID to search for TV shows with the discover.
    public static func networks(networkId: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: NetworksMDB?) -> Void) {
        Client.networks(networkId: networkId) { apiReturn in
            let data: NetworksMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }
}
