import Foundation

/// <#Description#>
public final class MovieService {

    /// <#Description#>
    static let shared: MovieService = MovieService()

    /// <#Description#>
    /// - Parameter id: <#id description#>
    /// - Returns: <#description#>
    public final func details(for id: Int) async throws -> Movie {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/movie/\(id)?api_key=\(apiKey)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let movieDetailsResult = try JSONDecoder().decode(Movie.self, from: data)
        return movieDetailsResult
    }

    /// <#Description#>
    /// - Parameters:
    ///   - id: <#id description#>
    ///   - completion: <#completion description#>
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

    /// <#Description#>
    /// - Parameter id: <#id description#>
    /// - Returns: <#description#>
    public final func alternativeTitles(for id: Int) async throws -> [Title] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/movie/\(id)/alternative_titles?api_key=\(apiKey)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let alternativeTitlesResponse = try JSONDecoder().decode(AlternativeTitlesResponse.self, from: data)
        return alternativeTitlesResponse.titles
    }

    /// <#Description#>
    /// - Parameters:
    ///   - id: <#id description#>
    ///   - completion: <#completion description#>
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

    /// <#Description#>
    /// - Parameter id: <#id description#>
    /// - Returns: <#description#>
    public final func externalIDs(for id: Int) async throws -> [ExternalIDType] {

        guard let apiKey = TMDBConfig.apikey else { throw TMDBError.invalidAPIKey }

        guard let url = URL(string: "\(TMDBConfig.apiUrl)/movie/\(id)/external_ids?api_key=\(apiKey)") else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

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

    /// <#Description#>
    /// - Parameters:
    ///   - id: <#id description#>
    ///   - completion: <#completion description#>
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
