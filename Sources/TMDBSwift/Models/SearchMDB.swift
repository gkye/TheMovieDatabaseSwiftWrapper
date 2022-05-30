import Foundation

private struct SearchResults: Decodable {
    let person: [PersonResults]?
    let tv: [TVMDB]?
    let movie: [MovieMDB]?

    enum CodingKeys: String, CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        person = try? container.decode([PersonResults].self, forKey: .results)
        tv = try? container.decode([TVMDB].self, forKey: .results)
        movie = try? container.decode([MovieMDB].self, forKey: .results)
    }
}

public struct SearchMDB {

    /// Search for companies by name.
    public static func company(query: String, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ company: [ParentCompanyMDB]? ) -> Void) {

        Client.Search("company", query: query, page: page, language: nil, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            let data: [ParentCompanyMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Search for collections by name. Overview and collectionItems will return nil
    public static func collection(query: String, page: Int?, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ collection: [CollectionMDB]? ) -> Void) {

        Client.Search("collection", query: query, page: page, language: language, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            let data: [CollectionMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Search for keywords by name.
    public static func keyword(query: String, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ keyword: [KeywordsMDB]? ) -> Void) {

        Client.Search("keyword", query: query, page: page, language: nil, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            let data: [KeywordsMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Search for movies by title.
    public static func movie(query: String, language: String?, page: Int?, includeAdult: Bool?, year: Int?, primaryReleaseYear: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {

        Client.Search("movie", query: query, page: page, language: language, include_adult: includeAdult, year: year, primary_release_year: primaryReleaseYear, search_type: nil, first_air_date_year: nil) { apiReturn in
            let data: [MovieMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Search for people by name.
    public static func person(query: String, page: Int?, includeAdult: Bool?, completion: @escaping (_ clientReturn: ClientReturn, _ person: [PersonResults]?) -> Void) {

        Client.Search("person", query: query, page: page, language: nil, include_adult: includeAdult, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            let data: [PersonResults]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Search for TV shows by title.
    public static func tv(query: String, page: Int?, language: String?, first_air_date_year: String?, completion: @escaping (_ clientReturn: ClientReturn, _ tvShows: [TVMDB]?) -> Void) {

        Client.Search("tv", query: query, page: page, language: language, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: first_air_date_year) { apiReturn in
            let data: [TVMDB]? = apiReturn.decodeResults()
            completion(apiReturn, data)
        }
    }

    /// Search multiple models in a single request. Multi search currently supports searching for movies, tv shows and people in a single request.
    public static func multiSearch(query: String, page: Int?, includeAdult: Bool?, language: String?, region: String?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?, _ tv: [TVMDB]?, _ person: [PersonResults]?) -> Void) {

        Client.Search("multi", query: query, page: page, language: language, include_adult: includeAdult, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            var person: [PersonResults]?
            var tv: [TVMDB]?
            var movie: [MovieMDB]?

            if let data = apiReturn.data,
               let decoded = try? JSONDecoder().decode(SearchResults.self, from: data) {
                tv = decoded.tv
                movie = decoded.movie
                person = decoded.person
            }
            completion(apiReturn, movie, tv, person)
        }
    }
}
