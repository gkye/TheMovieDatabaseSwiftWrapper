import Foundation

public final class KeywordService {

    /// The shared keyword service. Use to instantiate one instance of KeywordService for use throughout your application. If finer-grained optimizations are desired, create separate instances. See the init documentation for more details.
    static let shared: KeywordService = KeywordService()

    var urlSession: URLSessionProtocol

    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }

    /// Initializes the keyword service. Use for creating different KeywordService instances for optimizations. For instance, may be used to separate out high-priority requests and low-priority requests for performance. If one instance of KeywordService is preferred, see the shared documentation.
    public convenience init() {
        self.init(urlSession: URLSession.shared)
    }

    // MARK: - Get Keywords

    public final func keywords(for query: String, page: Int = 1) async throws -> PagedResults<[Keyword]> {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/search/keyword"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)"),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(PagedResults<[Keyword]>.self, from: data)
        return result
    }

    // MARK: - Get Keywords for Movie

    public final func keywords(movieID: Int) async throws -> [Keyword] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/movie/\(movieID)/keywords"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(KeywordResponse.self, from: data)
        return result.keywords
    }

    // MARK: - Get Keywords for TV

    public final func keywords(tvID: Int) async throws -> [Keyword] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/tv/\(tvID)/keywords"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(ResultsResponse<[Keyword]>.self, from: data)
        return result.results
    }

    // MARK: - Get TV Series for Keywords

    public final func tvSeries(keywords: [String], page: Int = 1) async throws -> PagedResults<[TVSeries]> {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/discover/tv"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
            URLQueryItem(name: "with_keywords", value: keywords.joined(separator: ",")),
            URLQueryItem(name: "page", value: "\(page)"),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(PagedResults<[TVSeries]>.self, from: data)
        return result
    }

    // MARK: - Get Movies for Keywords

    public final func movies(keywords: [String], page: Int = 1) async throws -> PagedResults<[Movie]> {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/discover/movie"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
            URLQueryItem(name: "with_keywords", value: keywords.joined(separator: ",")),
            URLQueryItem(name: "page", value: "\(page)"),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(PagedResults<[Movie]>.self, from: data)
        return result
    }

    // MARK: - Get Keywords for Keyword IDs

    public final func keyword(for keywordID: Int) async throws -> Keyword {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        var components = URLComponents()
        components.scheme = TMDBConfig.apiScheme
        components.host = TMDBConfig.apiHost
        components.path = "/3/keyword/\(keywordID)"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: TMDBConfig.language),
        ]

        guard let url = components.url else { throw TMDBError.invalidURL }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(Keyword.self, from: data)
        return result
    }
}
