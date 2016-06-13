//
//  Client_Keyword.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation




extension Client{
    static func keyword(keywordType: String, api_key: String!, completion: (ClientReturn) -> ()) -> (){
        let parameters: [String : AnyObject] = ["api_key": api_key]
        let url = keywordType
        
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            completion(apiReturn)
        })
    }
    
    static func keyword_movies(keywordType: String, api_key: String!, page: Int?, language: String?, completion: (ClientReturn) -> ()) -> (){
        var parameters: [String : AnyObject] = ["api_key": api_key]
        if(page != nil){
        parameters["page"] = page
        }
        if(language != nil){
        parameters["language"] = language
        }
        let url = keywordType
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
           
            completion(apiReturn)
        })
    }
    
    
    
}
