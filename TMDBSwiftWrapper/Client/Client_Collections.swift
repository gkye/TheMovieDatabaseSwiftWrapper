//
//  Client_Collections.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-06.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
    
    class func Collection(api_key: String!, collectionId: String!, language: String?, completion: (ClientReturn) -> ()) -> (){
        var parameters: [String : AnyObject] = ["api_key": api_key]
        if(language != nil){
            parameters["language"] = language
        }
        
        let url = "https://api.themoviedb.org/3/collection/\(collectionId)"
  
        print(url)
        networkRequest(url, parameters: parameters, completion: {
            apiReturn in
            completion(apiReturn)
        })
    }
}



