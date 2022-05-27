//
//  ConfigurationMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct ConfigurationMDB: Codable {
    public var base_url: String?
    public var secure_base_url: String?
    public var backdrop_sizes: [String]?
    public var logo_sizes: [String]?
    public var poster_sizes: [String]?
    public var profile_sizes: [String]?
    public var still_sizes: [String]?
    public var change_keys: [String]?

    enum CodingKeys: String, CodingKey {
        case images
        case base_url
        case secure_base_url
        case backdrop_sizes
        case logo_sizes
        case poster_sizes
        case profile_sizes
        case still_sizes
        case change_keys
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let images = try container.nestedContainer(keyedBy:
            CodingKeys.self, forKey: .images)
        change_keys = try? container.decode([String]?.self, forKey: .change_keys)

        base_url = try? images.decode(String.self, forKey: .base_url)
        secure_base_url = try? images.decode(String.self, forKey: .secure_base_url)
        backdrop_sizes = try? images.decode([String].self, forKey: .backdrop_sizes)
        logo_sizes = try? images.decode([String].self, forKey: .logo_sizes)
        poster_sizes = try? images.decode([String].self, forKey: .poster_sizes)
        profile_sizes = try? images.decode([String].self, forKey: .profile_sizes)
        still_sizes = try? images.decode([String].self, forKey: .still_sizes)
    }

    public func encode(to encoder: Encoder) throws {
        _ = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.credit_type, forKey: .credit_type)
//        try container.encode(self.department, forKey: .department)
//        try container.encode(self.job, forKey: .job)
//        try container.encode(self.media_Type, forKey: .media_Type)
    }

    /// This method currently holds the data relevant to building image URLs as well as the change key map.To build an image URL, you will need 3 pieces of data. The base_url, size and file path; . Simply combine them all and you will have a fully qualified URL. Here’s an example URL: http://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg
    public static func configuration(completion: @escaping (_ clientReturn: ClientReturn, _ data: ConfigurationMDB?) -> Void) {
        Client.Configuration { apiReturn in
            let data: ConfigurationMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }
}
