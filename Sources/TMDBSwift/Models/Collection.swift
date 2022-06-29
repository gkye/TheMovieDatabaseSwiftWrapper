import Foundation

/// <#Description#>
public struct Collection: Codable {
    /// <#Description#>
    public var id: Int
    /// <#Description#>
    public var name: String
    /// <#Description#>
    public var posterPath: String?
    /// <#Description#>
    public var backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
