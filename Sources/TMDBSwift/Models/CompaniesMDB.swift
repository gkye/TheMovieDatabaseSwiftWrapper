//
//  CompaniesMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct ParentCompanyMDB: Decodable {
    public  var name: String!
    public  var id: Int!
    public  var logo_path: String!
}

open class CompanyMDB: Decodable {
    open var description: String?
    open var headquarters: String?
    open var homepage: String!
    open var id: Int!
    open var logo_path: String!
    open var name: String!
    open var parent_company: ParentCompanyMDB?

    /// This method is used to retrieve all of the basic information about a company.
    open class func companyInfo(companyId: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: CompanyMDB?) -> Void) {
        Client.Company(companyId: companyId) { apiReturn in
            let data: CompanyMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }
}
