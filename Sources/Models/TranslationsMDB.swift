//
//  TranslationsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-07.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class TranslationsMDB{
    
    public var iso_639_1: String!
    public var name: String!
    public var english_name: String!
    
    init(translations: JSON){
        iso_639_1 = translations["iso_639_1"].string
        name = translations["name"].string
        english_name = translations["english_name"].string
    }
    
    ///Return an array of `TranslationsMDB`
    class func initialize(json: JSON)->[TranslationsMDB] {
        var translationsArray = [TranslationsMDB]()
        for i in 0 ..< json.count {
            translationsArray.append(TranslationsMDB(translations: json[i]))
        }
        return translationsArray
    }
}