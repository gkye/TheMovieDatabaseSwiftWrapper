//
//  Client_Collections.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-06.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation
extension Client{
    
    static func Collection(_ api_key: String!, collectionId: String!, language: String?, completion: @escaping (ClientReturn) -> ()) -> (){
        var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
        if(language != nil){
            parameters["language"] = language as AnyObject?
        }
        
        let url = "https://api.themoviedb.org/3/collection/" + collectionId
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            completion(apiReturn)
        })
    }
}



