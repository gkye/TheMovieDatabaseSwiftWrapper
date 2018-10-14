//
//  Changes.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation


public typealias Changes1MDB = (id:Double, adult:Bool?)

public struct ChangesMDB{
  public var id: Int64!
  public var adult: Bool!
  
  public init(results: JSON){
    id = results["id"].int64
    adult = results["adult"].bool
  }
  
  static func initReturn(_ json: JSON)->[ChangesMDB]{
    var changes = [ChangesMDB]()
    for i in 0 ..< json.count {
      changes.append(ChangesMDB(results: json[i]))
    }
    return changes
  }

    public enum ChangeType: String {
        case movie, tv, person
    }

    public static func changes(type changeType: ChangeType, page: Int? = 1, startDate: String? = nil, endDate:String? = nil, completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [ChangesMDB]?) -> ()) -> (){
        Client.Changes(changeType: changeType.rawValue, page: page, startDate: startDate, endDate: endDate){
            apiReturn in
            var changes: [ChangesMDB]?
            if let results = apiReturn.json?["results"] {
                changes = ChangesMDB.initReturn(results)
            }
            completionHandler(apiReturn, changes)
        }
    }

  @available(*, deprecated, renamed: "changes(type:page:startDate:endDate:completionHandler:)")
  public static func changes(changeType: String, page: Double? = nil, startDate: String? = nil, endDate:String? = nil, completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [ChangesMDB]?) -> ()) -> (){
    let pageValue: Int? = page != nil ? Int(page!) : nil

    changes(type: ChangeType(rawValue: changeType) ?? .movie, page: pageValue, startDate: startDate, endDate: endDate) { apiReturn, changes in
      completionHandler(apiReturn, changes)
    }
  }
}



