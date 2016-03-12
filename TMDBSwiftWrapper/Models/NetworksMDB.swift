//
//  NetworksMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class NetworksMDB{
    
    var id: Double!
    var name: String!
    init(results: JSON){
        if(results["id"] != nil){
            id = results["id"].double
        }
        if(results["name"] != nil){
            name = results["name"].string
        }
    }
    
    ///This method is used to retrieve the basic information about a TV network. You can use this ID to search for TV shows with the discover.
    class func networks(api_key: String, networkId: Int!, completion: (clientReturn: ClientReturn, data:NetworksMDB?) -> ()) -> (){
        Client.networks(api_key, networkId: networkId){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: NetworksMDB.init(results: apiReturn.json!))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
    
    
}