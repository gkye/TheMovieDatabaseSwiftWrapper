public struct SearchMDB {

    /// Search for companies by name.
    public static func company(query: String, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ company: [ParentCompanyMDB]? ) -> Void) {

        Client.Search("company", query: query, page: page, language: nil, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            var company = [ParentCompanyMDB]()
            if let json = apiReturn.json?["results"] {
                company = ParentCompanyMDB.initialize(json: json)
            }
            completion(apiReturn, company)
        }
    }

    /// Search for collections by name. Overview and collectionItems will return nil
    public static func collection(query: String, page: Int?, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ collection: [CollectionMDB]? ) -> Void) {

        Client.Search("collection", query: query, page: page, language: language, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            var collection = [CollectionMDB]()
            if let json = apiReturn.json?["results"] {
                collection = CollectionMDB.initialize(json: json)
            }
            completion(apiReturn, collection)
        }
    }

    /// Search for keywords by name.
    public static func keyword(query: String, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ keyword: [KeywordsMDB]? ) -> Void) {

        Client.Search("keyword", query: query, page: page, language: nil, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            var keywords = [KeywordsMDB]()
            if let json = apiReturn.json?["results"] {
                keywords = KeywordsMDB.initialize(json: json)
            }
            completion(apiReturn, keywords)
        }
    }

    /// Search for lists by name and description.
    public static func list(query: String, page: Int?, include_adult: Bool?, completion: @escaping (_ clientReturn: ClientReturn, _ list: [ListsMDB]? ) -> Void) {

        Client.Search("list", query: query, page: page, language: nil, include_adult: include_adult, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            var list: [ListsMDB]?
            if let json = apiReturn.json?["results"] {
                list = ListsMDB.initialize(json: json)
            }
            completion(apiReturn, list)
        }
    }

    /// Search for movies by title.
    public static func movie(query: String, language: String?, page: Int?, includeAdult: Bool?, year: Int?, primaryReleaseYear: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> Void) {

        Client.Search("movie", query: query, page: page, language: language, include_adult: includeAdult, year: year, primary_release_year: primaryReleaseYear, search_type: nil, first_air_date_year: nil) { apiReturn in
            var movie: [MovieMDB]?
            if let json = apiReturn.json?["results"] {
                movie = MovieMDB.initialize(json: json)
            }
            completion(apiReturn, movie)
        }
    }

    /// Search for people by name.
    public static func person(query: String, page: Int?, includeAdult: Bool?, completion: @escaping (_ clientReturn: ClientReturn, _ person: [PersonResults]?) -> Void) {

        Client.Search("person", query: query, page: page, language: nil, include_adult: includeAdult, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            var person: [PersonResults]?
            if let json = apiReturn.json?["results"] {
                person = PersonResults.initialize(json: json)
            }
            completion(apiReturn, person)
        }
    }

    /// Search for TV shows by title.
    public static func tv(query: String, page: Int?, language: String?, first_air_date_year: String?, completion: @escaping (_ clientReturn: ClientReturn, _ tvShows: [TVMDB]?) -> Void) {

        Client.Search("tv", query: query, page: page, language: language, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: first_air_date_year) { apiReturn in
            var person: [TVMDB]?
            if let json = apiReturn.json?["results"] {
                person = TVMDB.initialize(json: json)
            }
            completion(apiReturn, person)
        }
    }

    /// Search multiple models in a single request. Multi search currently supports searching for movies, tv shows and people in a single request.
    public static func multiSearch(query: String, page: Int?, includeAdult: Bool?, language: String?, region: String?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB], _ tv: [TVMDB], _ person: [PersonResults]) -> Void) {

        Client.Search("multi", query: query, page: page, language: language, include_adult: includeAdult, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
            var person = [PersonResults]()
            var tv = [TVMDB]()
            var movie = [MovieMDB]()

            apiReturn.json?["results"].forEach({ string, json in
                if let mediaType = json["media_type"].string {
                    switch mediaType {
                    case "tv":
                        tv.append(TVMDB(results: json))
                    case "movie":
                        movie.append(MovieMDB(results: json))
                    case "person":
                        person.append(PersonResults(results: json))
                    default:
                        break
                    }
                }
            })
            completion(apiReturn, movie, tv, person)
        }
    }
}
