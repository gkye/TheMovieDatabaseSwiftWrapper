//
//  Client_People.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

extension Client{
    
    class func Person(urlType: String!, api_key: String!, language: String?, page: Int?, completion: (ClientReturn) -> ()) -> (){
        let url = "http://api.themoviedb.org/3/person/\(urlType)"
        var parameters: [String : AnyObject] = ["api_key": api_key]
        if(language != nil){ parameters["language"] = language }
        if(page != nil){parameters["page"] = page}
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
        })
    }
    
}