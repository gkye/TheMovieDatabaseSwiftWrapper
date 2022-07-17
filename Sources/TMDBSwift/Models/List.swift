/// A list, created by a user.
public struct List: Codable, Equatable {
    /// A lists ID.
    public var id: Int
    /// The description.
    public var description: String?
    /// The total favorite count.
    public var favoriteCount: Int?
    /// The total item count.
    public var itemCount: Int?
    /// The language.
    public var language: Language?
    /// The name.
    public var name: String?
    /// The poster image path.
    ///
    /// To build an image URL, you will need 3 pieces of data. The `base_url`, `size` and `file_path`. Simply combine them all and you will have a fully qualified URL.
    ///
    /// Here’s an example URL:
    /// ```
    /// https://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg
    /// ```
    ///
    public var posterPath: String?

    public init(id: Int,
                description: String? = nil,
                favoriteCount: Int? = nil,
                itemCount: Int? = nil,
                language: Language? = nil,
                name: String? = nil,
                posterPath: String? = nil) {
        self.id = id
        self.description = description
        self.favoriteCount = favoriteCount
        self.itemCount = itemCount
        self.language = language
        self.name = name
        self.posterPath = posterPath
    }

    enum CodingKeys: String, CodingKey {
        case id
        case description
        case favoriteCount = "favorite_count"
        case itemCount = "item_count"
        case language = "iso_639_1"
        case name
        case posterPath = "poster_path"
    }
}
