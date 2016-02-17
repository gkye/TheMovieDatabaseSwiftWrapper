//
//  Client_MISC.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-17.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Alt_TitlesMDB{
    var title: String!
    var iso_3166_1: String!
    init(result: JSON){
        title = result["title"].string
        iso_3166_1 = result["iso_3166_1"].string
        
    }
}
class Alternative_TitlesMDB {
    var id: Int!
    var titles = [Alt_TitlesMDB]()
    init(results: JSON){
        id = results["id"].int
        if(results["results"].count > 0){
            for(var i = 0;i < results["results"].count; i++ ){
                titles.append(Alt_TitlesMDB.init(result: results))
            }
        }
    }
}
