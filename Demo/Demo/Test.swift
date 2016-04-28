//
//  Test.swift
//  Demo
//
//  Created by George on 2016-04-27.
//  Copyright © 2016 George. All rights reserved.
//

import Foundation
import TMDBSwift
import UIKit

class All: UIViewController {

    override func viewDidLoad() {
        GenresMDB.genre_movies(apikey, genreId: 37, include_all_movies: true, include_adult_movies: false, language: "EN"){
            apiReturn in
            let movie = apiReturn.data!
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
    }

}