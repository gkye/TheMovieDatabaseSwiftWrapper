//
//  CompaniesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-11.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON



class CompanyMDB {
    var description: String?
    var headquarters: String?
    var homepage: String!
    var id: Double!
    var logo_path: String!
    var name: String!
    var parent_company: parent_companymdb?
    
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
    struct CompanyMDBReturn{
        let clientReturn: ClientReturn!
        let companyMDBData: CompanyMDB?
        
        init(client: ClientReturn){
            clientReturn = client
            companyMDBData = CompanyMDB(results: client.json!)
        }
    }
    
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
    class func companyInfo(api_key: String!, companyId: Int!, completion: (clientReturn: ClientReturn, data:CompanyMDB?) -> ()) -> (){
        Client.Company(api_key, companyId: companyId){
            apiReturn in
            if(apiReturn.error == nil){
              completion(clientReturn: apiReturn, data: CompanyMDB(results: apiReturn.json!))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
    
    ///Get the list of movies associated with a particular company.
    class func companyMovies(api_key: String!, companyId: Int!, language: String?, page: Int?, completion: (clientReturn: ClientReturn, data: [MovieMDB]?) -> ()) -> (){
        Client.Company(api_key, companyId: companyId, language: language, page: page){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: MovieMDB.initialize(apiReturn.json!["results"]))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
}