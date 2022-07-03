import Foundation

/// A structure describing a member of the cast for a Movie or TV Series.
public struct CastMember: Codable, Equatable {
    /// <#Description#>
    public var id: Int
    /// <#Description#>
    public var adult: Bool?
    /// <#Description#>
    public var castID: Int?
    /// <#Description#>
    public var character: String
    /// <#Description#>
    public var creditID: String
    /// <#Description#>
    public var gender: Gender?
    /// <#Description#>
    public var knownForDepartment: String?
    /// <#Description#>
    public var name: String?
    /// <#Description#>
    public var originalName: String?
    /// <#Description#>
    public var order: Int?
    /// <#Description#>
    public var popularity: Double?
    /// <#Description#>
    public var profilePath: String?

    public init(id: Int,
                adult: Bool? = nil,
                castID: Int? = nil,
                character: String,
                creditID: String,
                gender: Gender? = nil,
                knownForDepartment: String? = nil,
                name: String? = nil,
                originalName: String? = nil,
                order: Int? = nil,
                popularity: Double? = nil,
                profilePath: String? = nil) {
        self.id = id
        self.adult = adult
        self.castID = castID
        self.character = character
        self.creditID = creditID
        self.gender = gender
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.order = order
        self.popularity = popularity
        self.profilePath = profilePath
    }

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case gender
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case order
        case popularity
        case profilePath = "profile_path"
    }
}
