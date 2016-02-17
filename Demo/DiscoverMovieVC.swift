//
//  DiscoverMovieVC.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-05.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import UIKit

class DiscoverMovieVC: UIViewController {
    
    var movie = [MovieMDB]()
    
    override func viewDidLoad() {
        //     Basic discover movie query
        DiscoverMovie.discoverMovies(apikey, language: "EN", page: 1, sort_by: DiscoverSortByMovie().revenue_desc){
            apiReturn in
            if(apiReturn.error == nil){
                let movie = apiReturn.MBDBReturn as! [MovieMDB]
                print(movie[0].title)
                print(movie[0].original_title)
                print(movie[0].release_date)
                print(movie[0].overview)
            }else{
                print(apiReturn.error)
            }
        }
        
        // Discover movies with genres action OR war. (`| (pipe)` used to indicate an `OR` query `,` used for an `AND` query) with Brad Pitt;
        DiscoverMovie.discoverMoviesWith(apikey, with_genres: "\(MovieGenres.Action.rawValue),\(MovieGenres.War.rawValue)", with_cast: nil, with_crew: nil, with_companies: nil, with_keywords: nil, with_people: "287", with_networks: nil, year: nil, sort_by: DiscoverSortByMovie().popularity_desc, page: 1, language: "EN"){
            apiReturn in
            let movie = apiReturn.MBDBReturn as! [MovieMDB]
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
        
        //Discover movies with genres Horror OR War with vote average greater than 8 and vote count greater than 2
        DiscoverMovie.discoverMovies(apikey, sort_by: nil, certification_country: nil, certification: nil, certification_lte: nil, certification_gte: nil, include_adult: true, include_video: true, primary_release_year: nil, primary_release_date_gte: nil, primary_release_date_lte: nil, release_date_gte: nil, release_date_lte: nil, language: "EN", page: 1, vote_average_gte: 8.0, vote_average_lte: 8, vote_count_gte: 2, vote_count_lte: nil, with_cast: nil, with_crew: nil, with_companies: nil, with_genres: MovieGenres.Horror.rawValue + "|" + MovieGenres.War.rawValue , with_keywords: nil, with_people: nil, with_networks: nil, year: nil){
            apiReturn in
            let movie = apiReturn.MBDBReturn as! [MovieMDB]
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
        
        //Discover movies with rating(certification) R certified in US and include movies with rating less than R, sorted by popularity (desc)
        Discover.discoverByRating(apikey, discoverType: "movie", certification: "R", certification_country: "CA", ceritfication_lte: "R",  ceritfication_gte: nil, sort_by: DiscoverSortByMovie().popularity_desc, page: nil, language: nil){
            apiReturn in
            let movie = apiReturn.MBDBReturn as! [MovieMDB]
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
        
        //Discover movies with release dates between 2015-01-01 AND 2015-01-05
        DiscoverMovie.discoverMovies(apikey, primary_release_date_gte: "2015-01-01", primary_release_date_lte: "2015-01-05", language: "EN", page: nil, sort_by: nil){
            apiReturn in
            let movie = apiReturn.MBDBReturn as! [MovieMDB]
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
    }
}