//
//  CompaniesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation

public struct parent_companymdb: ArrayObject{
  public  var name: String!
  public  var id: Int!
  public  var logo_path: String!
  public init(results: JSON){
    name = results["name"].string
    id = results["id"].int
    logo_path = results["logo_path"].string
  }
}

open class CompanyMDB {
  open var description: String?
  open var headquarters: String?
  open var homepage: String!
  open var id: Int!
  open var logo_path: String!
  open var name: String!
  open var parent_company: parent_companymdb?
    
  public init(results: JSON){
    description = results["description"].string
    headquarters = results["headquarters"].string
    homepage = results["homepage"].string
    id = results["id"].int
    logo_path = results["logo_path"].string
    name = results["name"].string
    if(results["parent_company"].count > 0){
      parent_company = parent_companymdb.init(results: results["parent_company"])
    }
  }
  ///This method is used to retrieve all of the basic information about a company.
  open class func companyInfo(_ api_key: String!, companyId: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data:CompanyMDB?) -> ()) -> (){
    Client.Company(api_key, companyId: companyId){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, CompanyMDB(results: apiReturn.json!))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
  
  ///Get the list of movies associated with a particular company.
  open class func companyMovies(_ api_key: String!, companyId: Int!, language: String?, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    Client.Company(api_key, companyId: companyId, language: language, page: page){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, MovieMDB.initialize(json: apiReturn.json!["results"]))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
}
