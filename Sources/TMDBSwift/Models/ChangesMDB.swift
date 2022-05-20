//
//  Changes.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public typealias Changes1MDB = (id: Double, adult: Bool?)

public struct ChangesMDB: Codable {
    public var id: Int64!
    public var adult: Bool!

    public enum ChangeType: String {
        case movie, tv, person
    }

    public static func changes(type changeType: ChangeType, page: Int? = 1, startDate: String? = nil, endDate: String? = nil, completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [ChangesMDB]?) -> Void) {
        Client.Changes(changeType: changeType.rawValue, page: page, startDate: startDate, endDate: endDate) { apiReturn in
            let data: [ChangesMDB]? = apiReturn.decodeResults()
            completionHandler(apiReturn, data)
        }
    }
}
