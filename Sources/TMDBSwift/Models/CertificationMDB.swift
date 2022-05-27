//
//  CertificationMDB.swift
//  TMDBSwift
//
//  Created by George Kye on 2016-06-07.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct Certification: Decodable {
    public var certification: String!
    public var meaning: String!
    public var order: Int!
}

public struct TVCertifications: Decodable {
    public var RU: [Certification]!
    public var US: [Certification]!
    public var CA: [Certification]!
    public var AU: [Certification]!
    public var FR: [Certification]!
    public var DE: [Certification]!
    public var TH: [Certification]!
    public var KR: [Certification]!
    public var GB: [Certification]!
    public var BR: [Certification]!
}

public struct MovieCertifications: Decodable {
    public var US: [Certification]!
    public var CA: [Certification]!
    public var AU: [Certification]!
    public var DE: [Certification]!
    public var FR: [Certification]!
    public var NZ: [Certification]!
    public var NI: [Certification]!
    public var TH: [Certification]!
    public var KR: [Certification]!
    public var GB: [Certification]!
    public var BR: [Certification]!
}

public struct CertificationsMDB: Decodable {

    // Get the list of supported certifications for tv shows.
    public static func tv(completionHandler: @escaping (_ clientReturn: ClientReturn, _ data: TVCertifications?) -> Void) {
        Client.Certification(listType: "tv") {
            apiReturn in
            let data: TVCertifications? = apiReturn.decode()
            completionHandler(apiReturn, data)
        }
    }
}
