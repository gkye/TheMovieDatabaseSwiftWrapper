//
//  CompaniesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-11.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation

public struct parent_companymdb: ArrayObject{
  public  var name: String!
  public  var id: Double!
  public  var logo_path: String!
  public init(results: JSON){
    name = results["name"].string
    id = results["id"].double
    logo_path = results["logo_path"].string
  }
}

public class CompanyMDB {
  public var description: String?
  public var headquarters: String?
  public var homepage: String!
  public var id: Double!
  public var logo_path: String!
  public var name: String!
  public var parent_company: parent_companymdb?
    
  public init(results: JSON){
    description = results["description"].string
    headquarters = results["headquarters"].string
    homepage = results["homepage"].string
    id = results["id"].double
    logo_path = results["logo_path"].string
    name = results["name"].string
    if(results["parent_company"].count > 0){
      parent_company = parent_companymdb.init(results: results["parent_company"])
    }
  }
  ///This method is used to retrieve all of the basic information about a company.
  public class func companyInfo(api_key: String!, companyId: Int!, completion: (clientReturn: ClientReturn, data:CompanyMDB?) -> ()) -> (){
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
  public class func companyMovies(api_key: String!, companyId: Int!, language: String?, page: Int?, completion: (clientReturn: ClientReturn, data: [MovieMDB]?) -> ()) -> (){
    Client.Company(api_key, companyId: companyId, language: language, page: page){
      apiReturn in
      if(apiReturn.error == nil){
        completion(clientReturn: apiReturn, data: MovieMDB.initialize(json: apiReturn.json!["results"]))
      }else{
        completion(clientReturn: apiReturn, data: nil)
      }
    }
  }
}