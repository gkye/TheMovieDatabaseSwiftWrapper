//
//  Client.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-11.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct ClientReturn{
    var error: NSError?
    var json: JSON?
    var MBDBReturn: AnyObject?
    var pageResults: PageResultsMDB?
}

class Client{
    class final func networkRequest(url: String, parameters: [String : AnyObject], completion: (ClientReturn) -> ()) -> (){
        
        Alamofire.request(.GET, url, parameters: parameters).validate().responseJSON { response in
            var cReturn = ClientReturn()
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    cReturn.error = nil
                    cReturn.json = json
                    cReturn.MBDBReturn = json.object
                    if(json["page"] != nil){
                        cReturn.pageResults = PageResultsMDB.init(results: json)
                    }else{
                        cReturn.pageResults = nil
                    }
                    
                    completion(cReturn)
                }
            case .Failure(let error):
                print(error)
                cReturn.error = error
                cReturn.json = nil
                cReturn.MBDBReturn = nil
                cReturn.pageResults = nil
                completion(cReturn)
            }
        }
    }
    
    
    
}