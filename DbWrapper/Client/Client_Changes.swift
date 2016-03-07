//
//  Client_Changes.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-11.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//
import Foundation
extension Client{
    
    class func Changes(api_key: String!, changeType: String, page: Double?, startDate: String?, endDate:String?, completion: (ClientReturn) -> ()) -> (){
        
        var parameters: [String : AnyObject] = ["api_key": api_key]
        
        if(page != nil){
           parameters["page"] = page
        }
       
        if(startDate != nil){
            parameters["start_date"] = startDate
        }
        
        if(endDate != nil){
            parameters["end_date"] = endDate
        }
        
        let url = "https://api.themoviedb.org/3/\(changeType)/changes"
        
        
        networkRequest(url, parameters: parameters){
            apiReturn in
           
            completion(apiReturn)
        }
    }
    

}
