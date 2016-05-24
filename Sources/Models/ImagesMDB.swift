//
//  ImagesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class Images_MDB: ArrayObject {
    public var aspect_ratio: String?
    public var file_path: String?
    public var height: Int?
    public var iso_639_1: String?
    public var vote_average: Int?
    public var vote_count: Int?
    public var width: Int?
    
    required public init(results: JSON){
        aspect_ratio = results["aspect_ratio"].string
        file_path = results["file_path"].string
        height = results["height"].int
        iso_639_1 = results["iso_639_1"].string
        vote_average = results["vote_average"].int
        vote_count = results["vote_count"].int
        width = results["width"].int
    }

}


public class ImagesMDB {
    public var backdrops = [Images_MDB]()
    public var posters = [Images_MDB]()
    public var stills = [Images_MDB]()
    public var id: Int!
    init(results: JSON){
        id = results["id"].int
        if(results["backdrops"].count > 0){
            for i in 0...results["backdrops"].count{
                backdrops.append(Images_MDB(results: results["backdrops"][i]))
            }
        }
        if(results["posters"].count > 0){
            for i in 0...results["posters"].count{
                posters.append(Images_MDB(results: results["posters"][i]))
            }
        }
        
        if(results["stills"].count > 0){
            for i in 0...results["stills"].count{
                stills.append(Images_MDB(results: results["stills"][i]))
            }
        }
    }
    
}

