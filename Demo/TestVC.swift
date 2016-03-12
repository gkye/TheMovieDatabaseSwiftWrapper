//
//  TestVC.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import UIKit
let apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"
class Test: UIViewController{
    
    override func viewDidLoad() {
        
        GenresMDB.genres(apikey, listType: "tv", language: "en"){
            apiReturn in
            let genres = apiReturn.data!
            for i in genres {
                print(i.name)
            }
        }
        
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


