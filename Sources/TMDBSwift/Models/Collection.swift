import Foundation

/// <#Description#>
public struct Collection: Decodable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        posterPath = try? container.decode(String.self, forKey: .posterPath)
        backdropPath = try? container.decode(String.self, forKey: .backdropPath)
    }
}
