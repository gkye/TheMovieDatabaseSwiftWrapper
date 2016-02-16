//
//  Client_Keyword.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension Client{
    
    class func keyword(api_key: String!, keywordId: Int!, page: Int?, movies: Bool?, completion: (ClientReturn) -> ()) -> (){
        let parameters: [String : AnyObject] = ["api_key": api_key]
        var url = "";
        if(movies == false || movies == nil){
            url = "http://api.themoviedb.org/3/keyword/\(keywordId)"
        }else{
            url = "http://api.themoviedb.org/3/keyword/\(keywordId)/movies"
        }
        
        networkRequest(url, parameters: parameters, completion: {
            apiReturn in
            var aReturn = apiReturn
            if(apiReturn.error == nil){
                if(movies == false || movies == nil){
                    aReturn.MBDBReturn = KeywordMDB.init(results: aReturn.json!)
                }else{
                    aReturn.MBDBReturn = MovieMDB.initialize(aReturn.json!["results"])
                }
            }
            completion(aReturn)
        })
    }
    
    
}
