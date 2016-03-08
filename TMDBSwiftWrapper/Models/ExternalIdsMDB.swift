//
//  ExternalIdsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-17.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON
class ExternalIdsMDB{
    
    var imdb_id: String?
    var freebase_mid: String?
    var id: Int!
    var freebase_id: String?
    var tvdb_id: Int?
    var tvrage_id: Int?
    
    
    //TV(S/EP) MV
    init(results: JSON){
        imdb_id = results["imdb_id"].string
        freebase_mid = results["freebase_mid"].string
        freebase_id = results["freebase_id"].string
        tvdb_id = results["tvdb_id"].int
        tvrage_id = results["tvrage_id"].int
        id = results["id"].int
    }
    
}
