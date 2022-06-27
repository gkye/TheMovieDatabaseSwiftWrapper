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
            URLQueryItem(name: "api_key", value: apiKey),

        let (data, _) = try await URLSession.shared.data(from: url)
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
    ///   - completion:  A closure to be invoked asynchronously after MovieService fetches data. The closure takes one parameter:
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
        components.path = "/movie/\(id)/alternative_titles"
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
    ///   - completion:  A closure to be invoked asynchronously after ``MovieService`` fetches data. The closure takes one parameter:
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

    // MARK: - Get External IDs

    /// Get the external ids for a movie.
    /// - Parameter id: A movies ID.
    /// - Returns: Returns an array of ``ExternalIDType`` for the requested movie ID.
    public final func externalIDs(for id: Int) async throws -> [ExternalIDType] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/movie/\(id)/external_ids"
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
    ///   - completion:  A closure to be invoked asynchronously after ``MovieService`` fetches data. The closure takes one parameter:
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
}
