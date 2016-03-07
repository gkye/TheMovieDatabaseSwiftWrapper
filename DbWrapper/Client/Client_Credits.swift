//
//  Client_Credits.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-07.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


extension Client{
    
    
    class func Credits(api_key: String, creditID: String, language: String, completion: (ClientReturn) -> ()) -> (){
        var parameters: [String : AnyObject] = ["api_key": api_key]
        parameters["language"] = language
        let url = "http://api.themoviedb.org/3/credit/\(creditID)"
    
        networkRequest(url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
            
        })
    }
}