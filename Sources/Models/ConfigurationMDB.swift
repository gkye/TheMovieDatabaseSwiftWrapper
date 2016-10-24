//
//  ConfigurationMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


public struct ConfigurationMDB {
  public var base_url: String!
  public var secure_base_url: String!
  public var backdrop_sizes: [String]!
  public var logo_sizes: [String]!
  public var poster_sizes: [String]!
  public var profile_sizes: [String]!
  public var still_sizes: [String]!
  public var change_keys: [String]!
  
  public init(results: JSON){
    let images = results["images"]
    base_url = images["base_url"].string
    secure_base_url = images["secure_base_url"].string
    backdrop_sizes = images["backdrop_sizes"].arrayObject as! [String]
    logo_sizes = images["logo_sizes"].arrayObject as! [String]
    poster_sizes = images["poster_sizes"].arrayObject as! [String]
    profile_sizes = images["profile_sizes"].arrayObject as! [String]
    still_sizes = images["still_sizes"].arrayObject as! [String]
    change_keys = results["change_keys"].arrayObject as! [String]
  }
  
  ///This method currently holds the data relevant to building image URLs as well as the change key map.To build an image URL, you will need 3 pieces of data. The base_url, size and file path; . Simply combine them all and you will have a fully qualified URL. Here’s an example URL: http://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg
  public static func configuration(_ api_key: String!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ConfigurationMDB?) -> ()) -> (){
    Client.Configuration(api_key){
      apiReturn in
      //var aReturn = apiReturn
      if(apiReturn.error == nil){
        completion(apiReturn, ConfigurationMDB.init(results: apiReturn.json!))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
}
