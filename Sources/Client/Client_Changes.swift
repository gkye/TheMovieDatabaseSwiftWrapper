//
//  Client_Changes.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George Kye. All rights reserved.
//
import Foundation
extension Client{
  
  static func Changes(changeType: String, page: Int?, startDate: String?, endDate:String?, completion: @escaping (ClientReturn) -> ()) -> (){
    
    var parameters: [String : AnyObject] = [:]
    
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
