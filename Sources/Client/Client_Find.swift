//
//  Client_Find.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-09.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
    
    
    class func Find(api_key: String!, external_id: String!, external_source: String!, completion: (ClientReturn) -> ()) -> (){
        var parameters: [String : AnyObject] = ["api_key": api_key]
        parameters["external_source"] = external_source
        
        let url = "https://api.themoviedb.org/3/find/\(external_id)"
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
        })
    }
}