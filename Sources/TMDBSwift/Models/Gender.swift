import Foundation

/// Supported genders from the database.
public enum Gender: Int, Codable, Equatable {
    case female = 1
    case male = 2
    case non_binary = 3
}
