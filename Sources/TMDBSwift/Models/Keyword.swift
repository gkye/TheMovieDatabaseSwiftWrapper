import Foundation

/// The structure representing a keywords name and ID.
public struct Keyword: Codable, Equatable {
    /// The text of a keyword, could be multiple words in one string.
    public var name: String
    /// The ID of a keyword.
    public var id: Int
}
