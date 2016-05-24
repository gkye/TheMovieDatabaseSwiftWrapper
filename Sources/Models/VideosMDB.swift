//
//  VideoMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class VideosMDB: ArrayObject{
    public var id: String!
    public var iso_639_1: String?
    public var key: String!
    public var name: String!
    public var site: String?
    public var size: Int!
    public var  type: String!
    
    required public init(results: JSON){
        id = results["id"].string
        iso_639_1 = results["iso_639_1"].string
        key = results["key"].string
        name = results["name"].string
        site = results["site"].string
        size = results["size"].int
        type = results["type"].string
    }
}