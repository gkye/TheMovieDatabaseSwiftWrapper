import Foundation

/// A structure describing a member of the crew for a Movie or TV Series.
public struct CrewMember: Codable, Equatable {
    /// <#Description#>
    public let id: Int
    /// <#Description#>
    public var adult: Bool?
    /// <#Description#>
    public var creditID: String
    /// <#Description#>
    public var department: String?
    /// <#Description#>
    public var gender: Gender?
    /// <#Description#>
    public var job: String?
    /// <#Description#>
    public var knownForDepartment: String?
    /// <#Description#>
    public var name: String?
    /// <#Description#>
    public var originalName: String?
    /// <#Description#>
    public var popularity: Double?
    /// <#Description#>
    public var profilePath: String?

    public init(id: Int,
                adult: Bool? = nil,
                creditID: String,
                department: String? = nil,
                gender: Gender? = nil,
                job: String? = nil,
                knownForDepartment: String? = nil,
                name: String? = nil,
                originalName: String? = nil,
                popularity: Double? = nil,
                profilePath: String? = nil) {
        self.id = id
        self.adult = adult
        self.creditID = creditID
        self.department = department
        self.gender = gender
        self.job = job
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
    }

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case creditID = "credit_id"
        case department
        case gender
        case job
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
    }
}
