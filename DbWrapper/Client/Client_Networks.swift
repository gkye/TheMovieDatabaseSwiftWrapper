//
//  Client_Networks.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
    
    class func networks(api_key: String!, networkId: Int!, completion: (ClientReturn) -> ()) -> (){
        let parameters: [String : AnyObject] = ["api_key": api_key]
         let url = "http://api.themoviedb.org/3/network/\(networkId)"
        networkRequest(url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
        })
    }
}