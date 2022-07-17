@testable import TMDBSwift
import XCTest

private let data = """
{
    "adult": false,
    "backdrop_path": "/jBFxXKCrViA88hhO59fDx0Av4P.jpg",
    "belongs_to_collection": {
        "id": 10,
        "name": "Star Wars Collection",
        "poster_path": "/bYbHqvRANCpuRTs0RAu10LhmVKU.jpg",
        "backdrop_path": "/d8duYyyC9J5T825Hg7grmaabfxQ.jpg"
    },
    "budget": 11000000,
    "genres": [
        {
            "id": 12,
            "name": "Adventure"
        },
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 878,
            "name": "Science Fiction"
        }
    ],
    "homepage": "http://www.starwars.com/films/star-wars-episode-iv-a-new-hope",
    "id": 11,
    "imdb_id": "tt0076759",
    "original_language": "en",
    "original_title": "Star Wars",
    "overview": "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
    "popularity": 138.085,
    "poster_path": "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg",
    "production_companies": [
        {
            "id": 1,
            "logo_path": "/o86DbpburjxrqAzEDhXZcyE8pDb.png",
            "name": "Lucasfilm Ltd.",
            "origin_country": "US"
        },
        {
            "id": 25,
            "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
            "name": "20th Century Fox",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "1977-05-25",
    "revenue": 775398007,
    "runtime": 121,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "A long time ago in a galaxy far, far away...",
    "title": "Star Wars",
    "video": false,
    "vote_average": 8.2,
    "vote_count": 17375
}
"""

private let dataWithGenreIDs = """
{
    "adult": false,
    "backdrop_path": "/jBFxXKCrViA88hhO59fDx0Av4P.jpg",
    "belongs_to_collection": {
        "id": 10,
        "name": "Star Wars Collection",
        "poster_path": "/bYbHqvRANCpuRTs0RAu10LhmVKU.jpg",
        "backdrop_path": "/d8duYyyC9J5T825Hg7grmaabfxQ.jpg"
    },
    "budget": 11000000,
    "genre_ids": [
        12,
        28,
        878
    ],
    "homepage": "http://www.starwars.com/films/star-wars-episode-iv-a-new-hope",
    "id": 11,
    "imdb_id": "tt0076759",
    "media_type": "movie",
    "original_language": "en",
    "original_title": "Star Wars",
    "overview": "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
    "popularity": 138.085,
    "poster_path": "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg",
    "production_companies": [
        {
            "id": 1,
            "logo_path": "/o86DbpburjxrqAzEDhXZcyE8pDb.png",
            "name": "Lucasfilm Ltd.",
            "origin_country": "US"
        },
        {
            "id": 25,
            "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
            "name": "20th Century Fox",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "1977-05-25",
    "revenue": 775398007,
    "runtime": 121,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "A long time ago in a galaxy far, far away...",
    "title": "Star Wars",
    "video": false,
    "vote_average": 8.2,
    "vote_count": 17375
}
"""

final class MovieTests: XCTestCase {
    func testEncode() throws {
        let movie = try JSONDecoder().decode(Movie.self, from: data.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(movie)
        let decodedMovie = try JSONDecoder().decode(Movie.self, from: encodedData)

        XCTAssertEqual(movie, decodedMovie)
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let movie = try jsonDecoder.decode(Movie.self, from: data.data(using: .utf8)!)

        XCTAssertEqual(movie.id, 11)
        XCTAssertEqual(movie.adult, false)
        XCTAssertEqual(movie.backdropPath, "/jBFxXKCrViA88hhO59fDx0Av4P.jpg")
        XCTAssertEqual(movie.budget, 11000000)
        XCTAssertEqual(movie.collection, Collection(id: 10,
                                                    name: "Star Wars Collection",
                                                    backdropPath: "/d8duYyyC9J5T825Hg7grmaabfxQ.jpg",
                                                    posterPath: "/bYbHqvRANCpuRTs0RAu10LhmVKU.jpg"))
        XCTAssertEqual(movie.genres, [Genre(id: 12, name: "Adventure"),
                                      Genre(id: 28, name: "Action"),
                                      Genre(id: 878, name: "Science Fiction")])
        XCTAssertEqual(movie.homepage, "http://www.starwars.com/films/star-wars-episode-iv-a-new-hope")
        XCTAssertEqual(movie.imdbID, .imdb("tt0076759"))
        XCTAssertEqual(movie.originalLanguage, .en)
        XCTAssertEqual(movie.originalTitle, "Star Wars")
        XCTAssertEqual(movie.overview, "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.")
        XCTAssertEqual(movie.popularity, 138.085)
        XCTAssertEqual(movie.posterPath, "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg")
        XCTAssertEqual(movie.productionCompanies, [Company(id: 1,
                                                           logoPath: "/o86DbpburjxrqAzEDhXZcyE8pDb.png",
                                                           name: "Lucasfilm Ltd.",
                                                           originCountry: "US"),
                                                   Company(id: 25,
                                                           logoPath: "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
                                                           name: "20th Century Fox",
                                                           originCountry: "US")])
        XCTAssertEqual(movie.productionCountries, [.US])
        XCTAssertEqual(movie.releaseDate, Calendar.current.date(from: DateComponents(year: 1977, month: 5, day: 25)))
        XCTAssertEqual(movie.revenue, 775398007)
        XCTAssertEqual(movie.runtime, 121)
        XCTAssertEqual(movie.spokenLanguages, [.en])
        XCTAssertEqual(movie.status, "Released")
        XCTAssertEqual(movie.tagline, "A long time ago in a galaxy far, far away...")
        XCTAssertEqual(movie.title, "Star Wars")
        XCTAssertEqual(movie.video, false)
        XCTAssertEqual(movie.voteAverage, 8.2)
        XCTAssertEqual(movie.voteCount, 17375)
    }

    func testEncode_WithGenreIDs() throws {
        let movie = try JSONDecoder().decode(Movie.self, from: dataWithGenreIDs.data(using: .utf8)!)
        let encodedData = try JSONEncoder().encode(movie)
        let decodedMovie = try JSONDecoder().decode(Movie.self, from: encodedData)

        XCTAssertEqual(movie, decodedMovie)
    }

    func testDecode_WithGenreIDs() throws {
        let jsonDecoder = JSONDecoder()
        let movie = try jsonDecoder.decode(Movie.self, from: dataWithGenreIDs.data(using: .utf8)!)

        XCTAssertEqual(movie.id, 11)
        XCTAssertEqual(movie.adult, false)
        XCTAssertEqual(movie.backdropPath, "/jBFxXKCrViA88hhO59fDx0Av4P.jpg")
        XCTAssertEqual(movie.budget, 11000000)
        XCTAssertEqual(movie.collection, Collection(id: 10,
                                                    name: "Star Wars Collection",
                                                    backdropPath: "/d8duYyyC9J5T825Hg7grmaabfxQ.jpg",
                                                    posterPath: "/bYbHqvRANCpuRTs0RAu10LhmVKU.jpg"))
        XCTAssertEqual(movie.genres, [Genre(id: 12),
                                      Genre(id: 28),
                                      Genre(id: 878)])
        XCTAssertEqual(movie.homepage, "http://www.starwars.com/films/star-wars-episode-iv-a-new-hope")
        XCTAssertEqual(movie.imdbID, .imdb("tt0076759"))
        XCTAssertEqual(movie.originalLanguage, .en)
        XCTAssertEqual(movie.originalTitle, "Star Wars")
        XCTAssertEqual(movie.overview, "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.")
        XCTAssertEqual(movie.popularity, 138.085)
        XCTAssertEqual(movie.posterPath, "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg")
        XCTAssertEqual(movie.productionCompanies, [Company(id: 1,
                                                           logoPath: "/o86DbpburjxrqAzEDhXZcyE8pDb.png",
                                                           name: "Lucasfilm Ltd.",
                                                           originCountry: "US"),
                                                   Company(id: 25,
                                                           logoPath: "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
                                                           name: "20th Century Fox",
                                                           originCountry: "US")])
        XCTAssertEqual(movie.productionCountries, [.US])
        XCTAssertEqual(movie.releaseDate, Calendar.current.date(from: DateComponents(year: 1977, month: 5, day: 25)))
        XCTAssertEqual(movie.revenue, 775398007)
        XCTAssertEqual(movie.runtime, 121)
        XCTAssertEqual(movie.spokenLanguages, [.en])
        XCTAssertEqual(movie.status, "Released")
        XCTAssertEqual(movie.tagline, "A long time ago in a galaxy far, far away...")
        XCTAssertEqual(movie.title, "Star Wars")
        XCTAssertEqual(movie.video, false)
        XCTAssertEqual(movie.voteAverage, 8.2)
        XCTAssertEqual(movie.voteCount, 17375)
    }
}
