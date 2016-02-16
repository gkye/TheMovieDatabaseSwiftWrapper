//
//  MovieVC.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-16.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class MovieVC : UIViewController{
    
    override func viewDidLoad() {
        
        //        MovieMDB.movie(apikey, movieID: 7984, language: "en"){
        //            apiReturn in
        //            let movie = apiReturn.MBDBReturn as! MovieDetailedMDB
        //            print(movie.title)
        //            print(movie.revenue)
        //            print(movie.genres[0].name)
        //            print(movie.production_companies[0].name)
        //
        //        }
//        MovieMDB.movie_credits(apikey, movieID: 871){
//            apiReturn in
//            let credits = apiReturn.MBDBReturn as! CastCrewMDB
//            for i in credits.cast {
//                print(i.cast_id)
//            }
//            for i1 in credits.crew {
//                print(i1.job)
//            }
//        }
//        MovieMDB.movie_videos(apikey, movieID: 607, language: "en"){
//            apiReturn in
//            let videos = apiReturn.MBDBReturn as! [VideosMDB]
//            for i in videos {
//                print(i.site)
//            }
//        }
//        
//
//
        MovieMDB.movie_images(apikey, movieID: 111, language: "en"){
            apiReturn in
            let images = apiReturn.MBDBReturn as! ImagesMDB
            if(images.posters.count > 0){
                print(images.posters[0].height)
            }
            if(images.backdrops.count > 0){
                print(images.backdrops[0].vote_average)
            }
        }
    }
}