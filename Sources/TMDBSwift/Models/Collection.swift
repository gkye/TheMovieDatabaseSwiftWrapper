import Foundation

/// <#Description#>
public struct Collection: Codable, Equatable {
    /// <#Description#>
    public var id: Int
    /// <#Description#>
    public var name: String
    /// <#Description#>
    public var backdropPath: String?
    /// <#Description#>
    public var posterPath: String?

    public init(id: Int,
                name: String,
                backdropPath: String? = nil,
                posterPath: String? = nil) {
        self.id = id
        self.name = name
        self.backdropPath = backdropPath
        self.posterPath = posterPath
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
