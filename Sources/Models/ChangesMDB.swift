//
//  Changes.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George KyeKye. All rights reserved.
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
  
  public static func changes(_ api_key: String!, changeType: String, page: Double?, startDate: String? = nil, endDate:String? = nil, completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: [ChangesMDB]?) -> ()) -> (){
    Client.Changes(api_key, changeType: "movie", page: 1, startDate: nil, endDate: nil){
      apiReturn in
      var changes: [ChangesMDB]?
      if(apiReturn.error == nil){
        changes = ChangesMDB.initReturn(apiReturn.json!["results"])
      }
      completionHandler(apiReturn, changes)
    }
  }
}



