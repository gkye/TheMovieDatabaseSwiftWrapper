//
//  Client_Configuration.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation
extension Client{
    //http://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg

    static func Configuration(_ api_key: String!, completion: @escaping (ClientReturn) -> ()) -> (){
        let parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
        let url = "https://api.themoviedb.org/3/configuration"
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
        })
    }
    
}

