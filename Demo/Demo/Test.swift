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

        MovieMDB.popular(apikey, language: "en", page: 1){
            popularMovies in
            let movie = popularMovies.movie!
            print(movie[0].title)
            print(movie[0].genre_ids)
        }
    }

}