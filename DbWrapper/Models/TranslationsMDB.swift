//
//  TranslationsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-07.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class TranslationsMDB{
    
    var iso_639_1: String!
    var name: String!
    var english_name: String!
    
    init(translations: JSON){
        iso_639_1 = translations["iso_639_1"].string
        name = translations["name"].string
        english_name = translations["english_name"].string
    }
    
    ///Return an array of `TranslationsMDB`
    class func initialize(json: JSON)->[TranslationsMDB] {
        var discoverReturn = [TranslationsMDB]()
        for(var i = 0; i < json.count; i++){
            discoverReturn.append(TranslationsMDB(translations: json[i]))
        }
        return discoverReturn
    }
}