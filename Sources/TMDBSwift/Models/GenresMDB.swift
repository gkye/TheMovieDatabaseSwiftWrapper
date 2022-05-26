//
//  GenresMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public enum GenresListType: String {
    case tv, movie
}

open class GenresMDB: KeywordsMDB {

    /// Get the list of tv or movie genres.
    open class func genres(listType: GenresListType, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [GenresMDB]?) -> Void) {
        Client.Genres(listType: listType.rawValue, language: language, genreId: 0, page: nil, include_all_movies: nil, include_adult: nil, movieList: false) { apiReturn in
            var genres: [GenresMDB]?
            if let json = apiReturn.json?["genres"] {
                genres = GenresMDB.initialize(json: json)
            }
            completion(apiReturn, genres)
        }
    }

    /// Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
    open class func genre_movies(genreId: Int, include_adult_movies: Bool, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> Void) {
        Client.Genres(listType: "movies", language: language, genreId: genreId, page: nil, include_all_movies: true, include_adult: nil, movieList: true) { apiReturn in
            var movies: [MovieMDB]?
            if let json = apiReturn.json?["results"] {
                movies = MovieMDB.initialize(json: json)
            }
            completion(apiReturn, movies)

        }
    }

}
