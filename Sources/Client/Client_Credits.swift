//
//  Client_Credits.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-07.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


extension Client{
    
    
    static func Credits(api_key: String, creditID: String, language: String, completion: (ClientReturn) -> ()) -> (){
        var parameters: [String : AnyObject] = ["api_key": api_key]
        parameters["language"] = language
        let url = "https://api.themoviedb.org/3/credit/\(creditID)"
    
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
            
        })
    }
}