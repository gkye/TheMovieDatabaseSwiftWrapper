//
//  Find.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-06.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

extension Client{
    class func Certification(api_key: String, listType: String, completion: (ClientReturn) -> ()) -> (){
        let parameters: [String : AnyObject] = ["api_key": api_key]
        let url = "https://api.themoviedb.org/3/certification/\(listType)/list";
        networkRequest(url, parameters: parameters, completion: {
            apiReturn in
            completion(apiReturn)
        })
      
    }
}

