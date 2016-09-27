//
//  Client_Changes.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George KyeKye. All rights reserved.
//
import Foundation
extension Client{
    
    static func Changes(_ api_key: String!, changeType: String, page: Double?, startDate: String?, endDate:String?, completion: @escaping (ClientReturn) -> ()) -> (){
        
        var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
        
        if(page != nil){
           parameters["page"] = page as AnyObject?
        }
       
        if(startDate != nil){
            parameters["start_date"] = startDate as AnyObject?
        }
        
        if(endDate != nil){
            parameters["end_date"] = endDate as AnyObject?
        }
        
        let url = "https://api.themoviedb.org/3/" + changeType + "/changes"
        
        
        networkRequest(url: url, parameters: parameters){
            apiReturn in
           
            completion(apiReturn)
        }
    }
    

}
