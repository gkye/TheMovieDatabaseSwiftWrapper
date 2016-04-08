//
//  MovieReleaseDatesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class MovieReleaseDatesMDB{
    
    public var iso_3166_1: String?
    public var release_dates = [Release_Dates]()
    init(results: JSON){
        iso_3166_1 = results["iso_3166_1"].string
        release_dates = Release_Dates.initialize(results["release_dates"])
    }
    
    ///Return an array of `MovieReleaseDatesMDB`
    class func initialize(json: JSON)->[MovieReleaseDatesMDB] {
        var releaseDatesArray = [MovieReleaseDatesMDB]()
        for i in 0...json.count{
            releaseDatesArray.append(MovieReleaseDatesMDB(results: json[i]))
        }
        return releaseDatesArray
    }
}

//move inside class?
public struct Release_Dates{
    public var certification: String?
    public var iso_639_1: String?
    public var note: String?
    public var release_date: String? //change to formatted NSDate later??
    public var type: Int?
    init(release_date: JSON){
        certification = release_date["certification"].string
        iso_639_1 = release_date["iso_639_1"].string
        if(release_date["note"] != nil){
            note = release_date["note"].string
        }else{
            note = " "
        }
        
        self.release_date = release_date["release_date"].string
        type = release_date["type"].int
    }
    static func initialize(json: JSON)->[Release_Dates] {
        var releaseDatesArray = [Release_Dates]()
        for i in 0...json.count{
            releaseDatesArray.append(Release_Dates(release_date: json[i]))
        }
        return releaseDatesArray
    }
}
