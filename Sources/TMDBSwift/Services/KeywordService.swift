import Foundation

/// <#Description#>
public final class KeywordService {

    /// <#Description#>
    static let shared: KeywordService = KeywordService()

    // get keywords for string

    /// <#Description#>
    /// - Parameter query: <#query description#>
    /// - Parameter page: <#page description#>
    /// - Returns: <#description#>
    public final func keywords(for query: String, page: Int = 1) async throws -> PagedResults<[Keyword]> {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/search/keyword?api_key=\(apiKey)&query=\(query)&page=\(page)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(PagedResults<[Keyword]>.self, from: data)
        return result
    }

    // get keywords for movie

    public final func keywords(movieID: Int) async throws -> [Keyword] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/movie/\(movieID)/keywords?api_key=\(apiKey)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(KeywordResponse.self, from: data)
        return result.keywords
    }

    // get keywords for tv

    public final func keywords(tvID: Int) async throws -> [Keyword] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/tv/\(tvID)/keywords?api_key=\(apiKey)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(ResultsResponse<[Keyword]>.self, from: data)
        return result.results
    }

    // get tv for keywords

    public final func tvSeries(keywords: [String], page: Int = 1) async throws -> PagedResults<[TVSeries]> {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/discover/tv?with_keywords=\(keywords.joined(separator: ","))&api_key=\(apiKey)&page=\(page)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(PagedResults<[TVSeries]>.self, from: data)
        return result
    }
    // get movie for keywords

    public final func movies(keywords: [String], page: Int = 1) async throws -> PagedResults<[Movie]> {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/discover/movie?with_keywords=\(keywords.joined(separator: ","))&api_key=\(apiKey)&page=\(page)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(PagedResults<[Movie]>.self, from: data)
        return result
    }

    // get detail for keyword id

    public final func keyword(for keywordID: Int) async throws -> Keyword {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/keyword/\(keywordID)?api_key=\(apiKey)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(Keyword.self, from: data)
        return result
    }
}
