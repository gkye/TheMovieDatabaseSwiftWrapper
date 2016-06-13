//
//  Client_Seasons.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-17.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
    static func Seasons(urlType: String!, api_key: String!, language: String?, completion: (ClientReturn) -> ()) -> (){
        var parameters: [String : AnyObject] = ["api_key": api_key]
        if(language != nil){
            parameters["language"] = language
        }
        
        let url = "https://api.themoviedb.org/3/tv/\(urlType)"
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            completion(apiReturn)
        })
    }
}