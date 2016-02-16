//
//  Client_Configuration.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
    //http://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg

    class func Configuration(api_key: String!, completion: (ClientReturn) -> ()) -> (){
        let parameters: [String : AnyObject] = ["api_key": api_key]
        let url = "http://api.themoviedb.org/3/configuration"
        networkRequest(url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
        })
    }
    
}

