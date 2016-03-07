//
//  Client_Movies.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-16.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
    class func Movies(urlType: String!, api_key: String!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
        
        var parameters: [String : AnyObject] = ["api_key": api_key]
        
        if(page != nil){
            parameters["page"] = page
        }
        
        if(language != nil){
            parameters["language"] = language
        }
        
        //--Alternative titles (lazy change later)
        if(urlType.containsString("alternative_titles")){
            print("alt", urlType)
            if(language != nil){
                parameters["country"] = language
            }
        }
        
        let url = "http://api.themoviedb.org/3/movie/\(urlType)"
        print(url)
        networkRequest(url, parameters: parameters, completion: {
            apiReturn in
            completion(apiReturn)
        })
    }
    

}