import Foundation

/// ``MovieService`` is the collection of movie centered endpoints containing methods that require a movie ID.
public final class MovieService {

    /// The shared movie service. Use to instantiate one instance of MovieService for use throughout your application. If finer-grained optimizations are desired, create separate instances. See the init documentation for more details.
    public static let shared: MovieService = MovieService()

    var urlSession: URLSessionProtocol

    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }

    /// Initializes the movie service. Use for creating different MovieService instances for optimizations. For instance, may be used to separate out high-priority requests and low-priority requests for performance. If one instance of MovieService is preferred, see the shared documentation.
    public convenience init() {
        self.init(urlSession: URLSession.shared)
    }

    // MARK: - Get Details

    /// Get the primary information about a movie.
    /// - Parameter id: A movies ID.
    /// - Returns: Returns a ``Movie`` the details for the requested movie ID.
    public final func details(for id: Int) async throws -> Movie {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/movie/\(id)"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await urlSession.data(from: url)

        let movieDetailsResult = try JSONDecoder().decode(Movie.self, from: data)
        return movieDetailsResult
    }

    /// Get the primary information about a movie.
    ///
    /// **Important**
    ///
    ///  You can call this method from synchronous code using a completion handler, as shown on this page, or you can call it as an asynchronous method that has the following declaration:
    ///  ```
    ///  func details(for id: Int) async throws -> Movie
    ///  ```
    ///
    /// - Parameters:
    ///   - id: A movies ID.
    ///   - completion: A closure to be invoked asynchronously after MovieService fetches data. The closure takes one parameter:
    ///   - movie: The fetched ``Movie``, or `nil` if none was found.
    public final func fetchDetails(for id: Int, completion: @escaping (Movie?) -> Void) {
        Task {
            do {
                let details = try await self.details(for: id)
                completion(details)
            } catch {
                completion(nil)
            }
        }
    }

    // MARK: - Get Alternative Titles

    /// Get the alternative titles for a movie.
    /// - Parameter id: A movies ID.
    /// - Returns: Returns an array of alternative titles for the requested movie ID
    public final func alternativeTitles(for id: Int, country: String? = nil) async throws -> [Title] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/movie/\(id)/alternative_titles"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
        ]

        if let country = country {
            components.queryItems?.append(URLQueryItem(name: "country", value: country))
        }

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await urlSession.data(from: url)

        let alternativeTitlesResponse = try JSONDecoder().decode(AlternativeTitlesResponse.self, from: data)
        return alternativeTitlesResponse.titles
    }

    /// Get the alternative titles for a movie.
    ///
    /// **Important**
    ///
    ///  You can call this method from synchronous code using a completion handler, as shown on this page, or you can call it as an asynchronous method that has the following declaration:
    ///  ```
    ///  func alternativeTitles(for id: Int, country: String? = nil) async throws -> [Title]
    ///  ```
    ///
    /// - Parameters:
    ///   - id: A movies ID.
    ///   - completion: A closure to be invoked asynchronously after ``MovieService`` fetches data. The closure takes one parameter:
    ///   - titles: The fetched array of ``Title``, or `nil` if none was found.
    public final func fetchAlternativeTitles(for id: Int, completion: @escaping ([Title]?) -> Void) {
        Task {
            do {
                let titles = try await self.alternativeTitles(for: id)
                completion(titles)
            } catch {
                completion(nil)
            }
        }
    }

    // MARK: - Get Credits

    /// Get the credits, cast and crew, for a movie.
    /// - Parameter id: A movies ID.
    /// - Returns: Returns the ``Credits`` for a requested movie ID.
    public final func credits(for id: Int) async throws -> Credits {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/movie/\(id)/credits"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await urlSession.data(from: url)

        let credits = try JSONDecoder().decode(Credits.self, from: data)
        return credits
    }

    /// Get the credits, cast and crew, for a movie.
    ///
    /// **Important**
    ///
    ///  You can call this method from synchronous code using a completion handler, as shown on this page, or you can call it as an asynchronous method that has the following declaration:
    ///  ```
    ///  func credits(for id: Int) async throws -> Credits
    ///  ```
    ///
    /// - Parameters:
    ///   - id: A movies ID.
    ///   - completion: A closure to be invoked asynchronously after ``MovieService`` fetches data. The closure takes one parameter:
    ///   - credits: The fetched array of ``Credits``, or `nil` if none was found.
    public final func fetchCredits(for id: Int, completion: @escaping (Credits?) -> Void) {
        Task {
            do {
                let types = try await self.credits(for: id)
                completion(types)
            } catch {
                completion(nil)
            }
        }
    }

    // MARK: - Get External IDs

    /// Get the external ids for a movie.
    /// - Parameter id: A movies ID.
    /// - Returns: Returns an array of ``ExternalIDType`` for the requested movie ID.
    public final func externalIDs(for id: Int) async throws -> [ExternalIDType] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/movie/\(id)/external_ids"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await urlSession.data(from: url)

        let externalIDResponse = try JSONDecoder().decode(ExternalIDResponse.self, from: data)

        var externalIDArray: [ExternalIDType] = []

        if let facebookID = externalIDResponse.facebook {
            externalIDArray.append(.facebook(facebookID))
        }

        if let instagramID = externalIDResponse.instagram {
            externalIDArray.append(.instagram(instagramID))
        }

        if let twitterID = externalIDResponse.twitter {
            externalIDArray.append(.twitter(twitterID))
        }

        if let imdbID = externalIDResponse.imdb {
            externalIDArray.append(.imdb(imdbID))
        }

        return externalIDArray
    }

    /// Get the external ids for a movie.
    ///
    /// **Important**
    ///
    ///  You can call this method from synchronous code using a completion handler, as shown on this page, or you can call it as an asynchronous method that has the following declaration:
    ///  ```
    ///  func externalIDs(for id: Int) async throws -> [ExternalIDType]
    ///  ```
    ///
    /// - Parameters:
    ///   - id: A movies ID.
    ///   - completion: A closure to be invoked asynchronously after ``MovieService`` fetches data. The closure takes one parameter:
    ///   - titles: The fetched array of ``ExternalIDType``, or `nil` if none was found.
    public final func fetchExternalIDs(for id: Int, completion: @escaping ([ExternalIDType]?) -> Void) {
        Task {
            do {
                let types = try await self.externalIDs(for: id)
                completion(types)
            } catch {
                completion(nil)
            }
        }
    }

    // MARK: - Get Images

    /// Get the images for a movie.
    /// - Parameters:
    ///   - id: A movies ID.
    ///   - languages: An array of languages to filter images.
    /// - Returns: Returns an tuple of ``Images`` for the requested movie ID.
    public final func images(for id: Int, languages: [String] = []) async throws -> (backdrops: [Image]?, logos: [Image]?, posters: [Image]?) {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/movie/\(id)/images"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
            URLQueryItem(name: "include_image_language", value: languages.joined(separator: ","))
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await urlSession.data(from: url)

        let imageResponse = try JSONDecoder().decode(ImageResponse.self, from: data)

        return (imageResponse.backdrops, imageResponse.logos, imageResponse.posters)
    }

    /// Get the images for a movie.
    ///
    /// **Important**
    ///
    ///  You can call this method from synchronous code using a completion handler, as shown on this page, or you can call it as an asynchronous method that has the following declaration:
    ///  ```
    ///  func images(for id: Int, languages: [String]) async throws -> (backdrops: [Image]?, logos: [Image]?, posters: [Image]?)
    ///  ```
    ///
    /// - Parameters:
    ///   - id: A movies ID.
    ///   - languages: An array of languages to filter images.
    ///   - completion: A closure to be invoked asynchronously after ``MovieService`` fetches data. The closure takes three parameters:
    ///   - backdrops: An array of ``Image``, or nil.
    ///   - logos: An array of ``Image``, or nil.
    ///   - posters: An array of ``Image``, or nil.
    public final func fetchImages(for id: Int, languages: [String] = [], completion: @escaping ((backdrops: [Image]?, logos: [Image]?, posters: [Image]?)) -> Void) {
        Task {
            do {
                let images = try await self.images(for: id, languages: languages)
                completion(images)
            } catch {
                completion((nil, nil, nil))
            }
        }
    }

    // MARK: - Get Keywords

    /// Get the keywords that have been added to a movie.
    /// - Parameter id: A movie's ID.
    /// - Returns: Returns an array of ``Keyword`` for the requested movie id.
    public final func keywords(for id: Int) async throws -> [Keyword] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/movie/\(id)/keywords"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await urlSession.data(from: url)

        let result = try JSONDecoder().decode(KeywordResponse.self, from: data)
        return result.keywords
    }

    /// Get the keywords that have been added to a movie.
    ///
    /// **Important**
    ///
    ///  You can call this method from synchronous code using a completion handler, as shown on this page, or you can call it as an asynchronous method that has the following declaration:
    ///  ```
    ///  func keywords(for id: Int) async throws -> [Keyword]
    ///  ```
    ///
    /// - Parameters:
    ///   - id: A movie's ID.
    ///   - completion: A closure to be invoked asynchronously after ``MovieService`` fetches data. The closure takes one parameter:
    ///   - keywords: The fetched array of ``Keyword``, or `nil` if none was found.
    public final func fetchKeywords(for id: Int, completion: @escaping ([Keyword]?) -> Void) {
        Task {
            do {
                let types = try await self.keywords(for: id)
                completion(types)
            } catch {
                completion(nil)
            }
        }
    }

    // MARK: - Get Lists

    /// Get the lists that the provided movie has been added to.
    /// - Parameters:
    ///   - id: A movie's ID.
    ///   - page: The page of results, defaults to the first page.
    /// - Returns: Returns a ``PagedResults`` of ``List`` for the requested movie id.
    public final func lists(for id: Int, page: Int = 1) async throws -> PagedResults<[List]> {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/movie/\(id)/lists"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
            URLQueryItem(name: "page", value: "\(page)")
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await urlSession.data(from: url)

        let result = try JSONDecoder().decode(PagedResults<[List]>.self, from: data)
        return result
    }

    /// Get the lists that the provided movie has been added to.
    ///
    /// **Important**
    ///
    ///  You can call this method from synchronous code using a completion handler, as shown on this page, or you can call it as an asynchronous method that has the following declaration:
    ///  ```
    ///  func lists(for id: Int, page: Int = 1) async throws -> PagedResults<[List]>
    ///  ```
    ///
    /// - Parameters:
    ///   - id: A movie's ID.
    ///   - page: The page of results, defaults to the first page.
    ///   - completion: A closure to be invoked asynchronously after ``MovieService`` fetches data. The closure takes one parameter:
    ///   - results: A ``PagedResults`` of ``List`` for the requested movie id.
    public final func fetchLists(for id: Int, page: Int = 1, completion: @escaping (PagedResults<[List]>?) -> Void) {
        Task {
            do {
                let results = try await self.lists(for: id, page: page)
                completion(results)
            } catch {
                completion(nil)
            }
        }
    }
}
