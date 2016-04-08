//
//  Changes.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-11.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public typealias Changes1MDB = (id:Double, adult:Bool!)

public class ChangesMDB{
    public var id: Int64!
    public var adult: Bool!
    
    init(results: JSON){
        id = results["id"].int64
        adult = results["adult"].bool
    }
    
    class func initReturn(json: JSON)->[ChangesMDB]{
        var changes = [ChangesMDB]()
        for(var i = 0; i < json.count; i++){
            changes.append(ChangesMDB(results: json[i]))
        }
        return changes
    }
    
    public class func changes(api_key: String!, changeType: String, page: Double?, startDate: String?, endDate:String?,completionHandler: (ClientReturn) -> ()) -> (){
        Client.Changes(api_key, changeType: "movie", page: 1, startDate: nil, endDate: nil){
            apiReturn in
            var aReturn = apiReturn;
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = ChangesMDB.initReturn(apiReturn.json!["results"])
            }
            completionHandler(aReturn)
        }
    }
}



