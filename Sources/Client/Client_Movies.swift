//
//  Client_Movies.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-16.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
    static func Movies(urlType: String!, api_key: String!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
        
        var parameters: [String : AnyObject] = ["api_key": api_key]
        
        if(page != nil){
            parameters["page"] = page
        }
        
        if(language != nil){
            parameters["language"] = language
        }
        
        //--Alternative titles (lazy change later)
        if(urlType.containsString("alternative_titles")){
            if(language != nil){
                parameters["country"] = language
            }
        }
        
        let url = "https://api.themoviedb.org/3/movie/\(urlType)"
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            completion(apiReturn)
        })
    }
    

}