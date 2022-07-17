import Foundation

/// A stucture representing an image and it's attributes.
public struct Image: Codable, Equatable {
    /// The image file path.
    ///
    /// To build an image URL, you will need 3 pieces of data. The `base_url`, `size` and `file_path`. Simply combine them all and you will have a fully qualified URL.
    ///
    /// Here’s an example URL:
    /// ```
    /// https://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg
    /// ```
    ///
    public var filePath: String
    /// The aspect ratio.
    public var aspectRatio: Double?
    /// The height.
    public var height: Int?
    /// The language, if any.
    public var language: Language?
    /// The average voting score.
    public var voteAverage: Double?
    /// The total vote count.
    public var voteCount: Int?
    /// The width.
    public var width: Int?

    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
        case aspectRatio = "aspect_ratio"
        case height
        case language = "iso_639_1"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case width
    }

    public init(filePath: String,
                aspectRatio: Double? = nil,
                height: Int? = nil,
                language: Language? = nil,
                voteAverage: Double? = nil,
                voteCount: Int? = nil,
                width: Int? = nil) {
        self.filePath = filePath
        self.aspectRatio = aspectRatio
        self.height = height
        self.language = language
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.width = width
    }
}
