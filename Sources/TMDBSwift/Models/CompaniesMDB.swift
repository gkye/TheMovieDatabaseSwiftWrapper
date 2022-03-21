//
//  CompaniesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct ParentCompanyMDB: ArrayObject{
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
  open var parent_company: ParentCompanyMDB?
    
  public init(results: JSON){
    description = results["description"].string
    headquarters = results["headquarters"].string
    homepage = results["homepage"].string
    id = results["id"].int
    logo_path = results["logo_path"].string
    name = results["name"].string
    if(results["parent_company"].count > 0){
      parent_company = ParentCompanyMDB.init(results: results["parent_company"])
    }
  }
  ///This method is used to retrieve all of the basic information about a company.
  open class func companyInfo(companyId: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: CompanyMDB?) -> ()) -> (){
    Client.Company(companyId: companyId){
      apiReturn in
      var company: CompanyMDB?
      if let json = apiReturn.json {
        company = CompanyMDB(results: json)
      }
      completion(apiReturn, company)
    }
  }
  
  ///Get the list of movies associated with a particular company.
  open class func companyMovies(companyId: Int!, language: String?, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    Client.Company(companyId: companyId, language: language, page: page){
      apiReturn in
      var movies: [MovieMDB]?
      if let json = apiReturn.json?["results"] {
        movies = MovieMDB.initialize(json: json)
      }
      completion(apiReturn, movies)
    }
  }
}
