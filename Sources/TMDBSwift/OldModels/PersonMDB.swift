//
//  PeopleMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

// MARK: Person

public struct PersonMDB: Decodable {
    public var adult: Bool?
    public var also_known_as: [String]?
    public var biography: String?
    public var birthday: String?
    public var deathday: String?
    public var homepage: String?
    public var id: Int!
    public var imdb_id: String?
    public var name: String?
    public var place_of_birth: String?
    public var popularity: Double?
    public var profile_path: String?

    /// Get the general person information for a specific id.
    public static func person_id(personID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonMDB?) -> Void) {
        let urlType = String(personID)
        Client.Person(urlType, language: nil, page: nil) { apiReturn in
            let data: PersonMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the movie credits for a specific person id.
    public static func movie_credits(personID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonMovieCredits?) -> Void) {
        let urlType = String(personID) + "/movie_credits"
        Client.Person(urlType, language: language, page: nil) { apiReturn in
            let data: PersonMovieCredits? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }
    /// Get the TV credits for a specific person id.
    public static func tv_credits(personID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonTVCredits?) -> Void) {
        let urlType =  String(personID) + "/tv_credits"
        Client.Person(urlType, language: language, page: nil) { apiReturn in
            let data: PersonTVCredits? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the combined (movie and TV) credits for a specific person id.
    public static func combined_credits(personID: Int!, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonCreditsCombined?) -> Void) {
        let urlType =  String(personID) + "/combined_credits"
        Client.Person(urlType, language: language, page: nil) { apiReturn in
            let data: PersonCreditsCombined? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the external ids for a specific person id.
    public static func externalIDS(personID: Int!, completion: @escaping (_ clientReturn: ClientReturn, _ data: ExternalIdsMDB?) -> Void) {
        Client.Person( String(personID) + "/external_ids", language: nil, page: nil) { apiReturn in
            let data: ExternalIdsMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the images for a specific person id.
    public static func images(personID: Int!, language: String? = nil, completion: @escaping (_ client: ClientReturn, _ data: [ImageMDB]?) -> Void) {
        Client.Person( String(personID) + "/images", language: language, page: nil) { apiReturn in
            var images: [ImageMDB]?
            if let data = apiReturn.data,
               let decodedWrapper = try? JSONDecoder().decode(ProfilesWrapper<ImageMDB>.self, from: data) {
                images = decodedWrapper.profiles
            }
            completion(apiReturn, images)
        }
    }
    /// Get the images that have been tagged with a specific person id. Will return all of the image results with a media object mapped for each image.
    public static func tagged_images(personID: Int!, page: Int?, language: String? = nil, completion: @escaping (_ client: ClientReturn, _ data: TaggedImagesMDB?) -> Void) {
        Client.Person( String(personID) + "/tagged_images", language: language, page: page) { apiReturn in
            let data: TaggedImagesMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the latest person id.
    public static func latest(language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: PersonMDB?) -> Void) {
        Client.Person("latest", language: language, page: nil) { apiReturn in
            let data: PersonMDB? = apiReturn.decode()
            completion(apiReturn, data)
        }
    }

    /// Get the list of popular people on The Movie Database. This list refreshes every day.
    public static func popular(page: Int?, language: String? = nil, completion: @escaping (_ clientReturn: ClientReturn, _ data: [PersonResults]?) -> Void) {
        Client.Person("popular", language: language, page: page) { apiReturn in
            let data: [PersonResults]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }
}

// MARK: Movie Crew & TV Crew common
public class PersonCrewCommon: Decodable {
    public var poster_path: String?
    public var credit_id: String!
    public var department: String!
    public var id: Int!
    public var job: String!
}

// MARK: Movie Crew
public class PersonMovieCrew: PersonCrewCommon {
    public var adult: Bool!
    public var original_title: String!
    public var release_date: String!
    public var title: String!
}

// MARK: TV Crew
public class PersonTVCrew: PersonCrewCommon {
    public var episode_count: Int!
    public var first_air_date: String!
    public var name: String!
    public var original_name: String!
}

public class PersonMovieTVCastCommon: Decodable {
    public var poster_path: String?
    public var credit_id: String!
    public var id: Int!
    public var character: String!
}

// MARK: TV CAST
public class PersonTVCast: PersonMovieTVCastCommon {
    public var episode_count: Int!
    public var first_air_date: String!
    public var name: String!
    public var original_name: String!
}

// MARK: Movie Cast
public class PersonMovieCast: PersonMovieTVCastCommon {
    public var adult: Bool!
    public var original_title: String!
    public var release_date: String!
    public var title: String!
}

public struct PersonTVCredits: Decodable {
    public var crew: [PersonTVCrew]
    public var cast: [PersonTVCast]
    public var id: Int!
}

public struct PersonMovieCredits: Decodable {
    public var crew: [PersonMovieCrew]
    public var cast: [PersonMovieCast]
    public var id: Int!
}

public struct PersonCreditsCombined: Decodable {
    public var tvCredits: (crew: [PersonTVCrew]?, cast: [PersonTVCast]?)
    public var movieCredits: (crew: [PersonMovieCrew]?, cast: [PersonMovieCast]?)
    public var id: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case cast
        case crew
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int?.self, forKey: .id)
        let tvCast = try? container.decode([PersonTVCast]?.self, forKey: .cast)
        let movieCast = try? container.decode([PersonMovieCast]?.self, forKey: .cast)
        let tvCrew = try? container.decode([PersonTVCrew]?.self, forKey: .crew)
        let movieCrew = try? container.decode([PersonMovieCrew]?.self, forKey: .crew)
        tvCredits = (crew: tvCrew, cast: tvCast)
        movieCredits = (crew: movieCrew, cast: movieCast)
    }
}

public enum TaggedImageMediaMDB {
    case movie(DiscoverMovieMDB)
    case tv(DiscoverTVMDB)
}

public class TaggedImageMDB: ImageMDB {
    public var media: TaggedImageMediaMDB!

    enum CodingKeys: String, CodingKey {
        case media
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try super.init(from: decoder)
        if let tv = try? container.decode(DiscoverTVMDB?.self, forKey: .media) {
            media = .tv(tv)
        }
        if let movie = try? container.decode(DiscoverMovieMDB?.self, forKey: .media) {
            media = .movie(movie)
        }
    }
}

public struct TaggedImagesMDB: Decodable {
    public var images: [TaggedImageMDB] = []
    public var id: Int!
    public var pageResults: PageResultsMDB!

    enum CodingKeys: String, CodingKey {
        case images = "results"
        case id
        case page
        case total_results
        case total_pages
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let idValue = try container.decode(Int.self, forKey: .id)
        id = Int(idValue)
        images = try container.decode([TaggedImageMDB].self, forKey: .images)
        pageResults = PageResultsMDB(page: try? container.decode(Int?.self, forKey: .page),
                                     total_results: try? container.decode(Int?.self, forKey: .total_results),
                                     total_pages: try? container.decode(Int?.self, forKey: .total_pages))
    }
}
