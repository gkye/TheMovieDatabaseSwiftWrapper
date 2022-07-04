/// <#Description#>
public struct Author: Codable, Equatable {
    /// <#Description#>
    public var username: String
    /// <#Description#>
    public var name: String?
    /// <#Description#>
    public var avatarPath: String?
    /// <#Description#>
    public var rating: Double?
    /// <#Description#>
    public var displayName: String {
        return name ?? username
    }

    public init(username: String,
                name: String? = nil,
                avatarPath: String? = nil,
                rating: Double? = nil) {
        self.username = username
        self.name = name
        self.avatarPath = avatarPath
        self.rating = rating
    }

    enum CodingKeys: String, CodingKey {
        case username
        case name
        case avatarPath = "avatar_path"
        case rating
    }


    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Author.CodingKeys> = try decoder.container(keyedBy: Author.CodingKeys.self)

        self.username = try container.decode(String.self, forKey: Author.CodingKeys.username)

        if let nameString = try? container.decodeIfPresent(String.self, forKey: Author.CodingKeys.name), nameString != "" {
            name = nameString
        }

        if let avatarPathString = try? container.decodeIfPresent(String.self, forKey: Author.CodingKeys.avatarPath), avatarPathString != "" {
            avatarPath = avatarPathString
        }

        self.rating = try container.decodeIfPresent(Double.self, forKey: Author.CodingKeys.rating)

    }

    public func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<Author.CodingKeys> = encoder.container(keyedBy: Author.CodingKeys.self)

        try container.encode(self.username, forKey: Author.CodingKeys.username)
        try container.encodeIfPresent(self.name, forKey: Author.CodingKeys.name)
        try container.encodeIfPresent(self.avatarPath, forKey: Author.CodingKeys.avatarPath)
        try container.encodeIfPresent(self.rating, forKey: Author.CodingKeys.rating)
    }
}
