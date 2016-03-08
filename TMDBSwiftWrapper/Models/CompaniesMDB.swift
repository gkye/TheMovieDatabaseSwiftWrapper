//
//  CompaniesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-11.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

struct parent_companymdb{
    var name: String!
    var id: Double!
    var logo_path: String!
    init(results: JSON){
        name = results["name"].string
        id = results["id"].double
        logo_path = results["logo_path"].string
    }
}

class CompanyMDB {
    var description: String?
    var headquarters: String?
    var homepage: String!
    var id: Double!
    var logo_path: String!
    var name: String!
    var parent_company: parent_companymdb?
    
    init(results: JSON){
        description = results["description"].string
        headquarters = results["headquarters"].string
        id = results["id"].double
        logo_path = results["logo_path"].string
        name = results["name"].string
        if(results["parent_company"].count > 0){
            parent_company = parent_companymdb.init(results: results["parent_company"])
        }
    }
    ///This method is used to retrieve all of the basic information about a company.
    class func companyInfo(api_key: String!, companyId: Int!, completion: (ClientReturn) -> ()) -> (){
        Client.Company(api_key, companyId: companyId){
            apiReturn in
            var aReturn = apiReturn;
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = CompanyMDB(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
    
    ///Get the list of movies associated with a particular company.
    class func companyMovies(api_key: String!, companyId: Int!, language: String?, page: Int?, completion: (ClientReturn) -> ()) -> (){
        Client.Company(api_key, companyId: companyId, language: language, page: page){
            apiReturn in
            var aReturn = apiReturn;
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = MovieMDB.initialize(apiReturn.json!["results"])
            }
            completion(aReturn)
        }
    }
}