//
//  CreditsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-07.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation



struct Credits_Episodes{
    var air_date: String!
    var episode_number: Int!
    var overview: String!
    var season_number: Int!
    var still_path: String?
    //add init
}
struct Credits_Seasons{
    var air_date: String!
    var poster_path: String!
    var season_number: Int!
    //add init
}


struct Credits_Media{
    var id: Int!
    var name: String!
    var original_name: String!
    var character: String!
    var episodes: [Credits_Episodes]!
    var seasons: [Credits_Seasons]!
    //add init
}

class CreditsMDB{
    
    var credit_type: String!
    var department: String!
    var job: String!
    var media: Credits_Media!
    var mediaType: String!
    var id: String!
    var person: (name: String!, id: Int!)
    //super.init
    
    
}