//
//  Client_MISC.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-17.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

public struct Alt_TitlesMDB{
    public var title: String!
    public var iso_3166_1: String!
    init(result: JSON){
        title = result["title"].string
        iso_3166_1 = result["iso_3166_1"].string
        
    }
}
public class Alternative_TitlesMDB {
    
    
    public var id: Int!
    public var titles = [Alt_TitlesMDB]()
    
    init(results: JSON){
        id = results["id"].int
        if(results["results"] != nil){ //TV Changes
            for i in 0 ..< results["results"].count {
                titles.append(Alt_TitlesMDB.init(result: results["results"][i]))
            }
        }else if (results["titles"] != nil){ //Movie Changes
            for i in 0 ..< results["titles"].count {
                titles.append(Alt_TitlesMDB.init(result: results["titles"][i]))
            }
        }
        
    }
}
