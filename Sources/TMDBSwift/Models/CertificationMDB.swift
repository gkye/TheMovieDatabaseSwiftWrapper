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

    enum CodingKeys: String, CodingKey {
        case certifications
        case RU
        case US
        case CA
        case AU
        case FR
        case DE
        case TH
        case KR
        case GB
        case BR
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let certifications = try container.nestedContainer(keyedBy:
            CodingKeys.self, forKey: .certifications)

        RU = try? certifications.decode([Certification].self, forKey: .RU)
        US = try? certifications.decode([Certification].self, forKey: .US)
        CA = try? certifications.decode([Certification].self, forKey: .CA)
        AU = try? certifications.decode([Certification].self, forKey: .AU)
        FR = try? certifications.decode([Certification].self, forKey: .FR)
        DE = try? certifications.decode([Certification].self, forKey: .DE)
        TH = try? certifications.decode([Certification].self, forKey: .TH)
        KR = try? certifications.decode([Certification].self, forKey: .KR)
        GB = try? certifications.decode([Certification].self, forKey: .GB)
        BR = try? certifications.decode([Certification].self, forKey: .BR)
    }
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
        Client.Certification(listType: "tv") { apiReturn in
            let data: TVCertifications? = apiReturn.decode()
            completionHandler(apiReturn, data)
        }
    }
}
