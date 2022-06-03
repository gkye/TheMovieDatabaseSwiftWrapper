//
//  CompaniesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct ParentCompanyMDB: Decodable {
    public var name: String!
    public var id: Int!
    public var logo_path: String!
}

public class CompanyMDB: Decodable {
    public var description: String?
    public var headquarters: String?
    public var homepage: String!
    public var id: Int!
    public var logo_path: String!
    public var name: String!
    public var parent_company: ParentCompanyMDB?

    /// This method is used to retrieve all of the basic information about a company.
    public static func companyInfo(companyId: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: CompanyMDB?) -> Void) {
        Client.Company(companyId: companyId) { apiReturn in
            let data: CompanyMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the list of movies associated with a particular company.
    public static func companyMovies(companyId: Int!, language: String?, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> Void) {
        Client.Company(companyId: companyId, language: language, page: page) { apiReturn in
            var movies: [MovieMDB]?
            if let data = apiReturn.data,
               let decodedWrapper = try? JSONDecoder().decode(ResultsStringWrapper<MovieMDB>.self, from: data) {
                movies = decodedWrapper.results
            }
            completion(apiReturn, movies)
        }
    }
}
