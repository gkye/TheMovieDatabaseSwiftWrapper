import Foundation

public enum ExternalIDType: Codable {
    case facebook(String)
    case twitter(String)
    case instagram(String)
    case imdb(String)
}
