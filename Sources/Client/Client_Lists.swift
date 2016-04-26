//
//  Client_List.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


extension Client{
       
    class func Lists(url: String!, api_key: String!, listId: String!, completion: (ClientReturn) -> ()) -> (){
        let parameters: [String : AnyObject] = ["api_key": api_key]
        networkRequest(url: url, parameters: parameters, completion: {
            apiReturn in
            
            completion(apiReturn)
        })
    }
}