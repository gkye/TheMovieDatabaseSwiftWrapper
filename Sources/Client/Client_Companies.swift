//
//  Client_Companies.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-11.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

extension Client{
    
    class func Company(api_key: String!, companyId: Int!, completion: (ClientReturn) -> ()) -> (){
        let parameters: [String : AnyObject] = ["api_key": api_key]
        let url = "https://api.themoviedb.org/3/company/\(companyId)"
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
        })
    }
    
    class func Company(api_key: String!, companyId: Int!, language: String?, page: Int?, completion: (ClientReturn) -> ()) -> (){
        var parameters: [String : AnyObject] = ["api_key": api_key]
        if(page != nil){
            parameters["page"] = page
        }
        
        if(language != nil){
            parameters["language"] = language
        }
        
        let url = "https://api.themoviedb.org/3/company/\(companyId)/movies"
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
        })
    }
    
}