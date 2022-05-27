//
//  Client_List.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client {

    static func Lists(_ url: String!, listId: String!, completion: @escaping (ClientReturn) -> Void) {
        let parameters: [String: AnyObject] = [:]
        networkRequest(url: url, parameters: parameters, completion: { apiReturn in
            completion(apiReturn)
        })
    }
}
