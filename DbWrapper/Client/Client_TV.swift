//
//  Client_TV.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

extension Client{
    class func TV(urlType: String!, api_key: String!, page: Int?, language: String?, timezone: String?, completion: (ClientReturn) -> ()) -> (){
        
        var parameters: [String : AnyObject] = ["api_key": api_key]
        
        if(page != nil){
            parameters["page"] = page
        }
        
        if(language != nil){
            parameters["language"] = language
        }
        if(timezone != nil){
            parameters["timezone"] = timezone
        }
        
        let url = "http://api.themoviedb.org/3/tv/\(urlType)"
        
        networkRequest(url, parameters: parameters, completion: {
            apiReturn in
            completion(apiReturn)
        })
    }
}

