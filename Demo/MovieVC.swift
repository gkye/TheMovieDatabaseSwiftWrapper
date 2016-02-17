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
        //                MovieMDB.movie_credits(apikey, movieID: 871){
        //                    apiReturn in
        //                    let credits = apiReturn.MBDBReturn as! CastCrewMDB
        //                    for i in credits.cast {
        //                        print(i.cast_id)
        //                    }
        //                    for i1 in credits.crew {
        //                        print(i1.job)
        //                    }
        //                }
        //        MovieMDB.movie_videos(apikey, movieID: 607, language: "en"){
        //                    apiReturn in
        //                    let videos = apiReturn.MBDBReturn as! [VideosMDB]
        //                    for i in videos {
        //                        print(i.site)
        //                    }
        //        }
        //
        //
        //
        //        MovieMDB.movie_images(apikey, movieID: 111, language: "en"){
        //            apiReturn in
        //            let images = apiReturn.MBDBReturn as! ImagesMDB
        //            if(images.posters.count > 0){
        //                print(images.posters[0].height)
        //            }
        //            if(images.backdrops.count > 0){
        //                print(images.backdrops[0].vote_average)
        //            }
        //        }
        //
        //        Discover.discover(apikey, discoverType: "tv", language: nil){
        //            apiReturn in
        //            let tvshows = apiReturn.MBDBReturn as! [TVMDB]
        //            print(tvshows[0].name)
        //            print(tvshows[0].overview)
        //            print(tvshows[0].popularity)
        //        }
        //
        
        //Get all Western(37) movies, exclude adult movies
        //        GenresMDB.genre_movies(apikey, genreId: 37, include_all_movies: true, include_adult_movies: false, language: "EN"){
        //            apiReturn in
        //            print(apiReturn.pageResults?.total_pages)
        //            print(apiReturn.pageResults?.total_results)
        //
        //            let movie = apiReturn.MBDBReturn as! [MovieMDB]
        //            print(movie[0].title)
        //            print(movie[0].original_title)
        //            print(movie[0].release_date)
        //            print(movie[0].overview)
        //        }
        //
        //        //Get the list of movie OR tv genres
        //        GenresMDB.genres(apikey, listType: "tv", language: "FR"){
        //            apiReturn in
        //            let genres = apiReturn.MBDBReturn as! [GenresMDB]
        //            for i in genres {
        //                print(i.name)
        //            }
        //        }
        //
        
        
        //        TVSeasonsMDB.season_number(apikey, tvShowId: 1398, seasonNumber: 1, language: "EN"){
        //            apiReturn in
        //            let season = apiReturn.MBDBReturn as! TVSeasonsMDB
        //            print(season.name)
        //            print(season.overview)
        //            print(season.episodes[0].name)
        //        }
        //
        //        TVSeasonsMDB.season_credits(apikey, tvShowId: 1398, seasonNumber: 1, language: "EN"){
        //                    apiReturn in
        //                    let credits = apiReturn.MBDBReturn as! CastCrewMDB
        //                    print(credits.crew.count)
        //                    for i in credits.cast {
        //                        print(i.credit_id)
        //                    }
        //                    for i1 in credits.crew {
        //                        print(i1.job)
        //                    }
        //                }
        //
        //        TVSeasonsMDB.season_videos(apikey, tvShowId: 60735, seasonNumber: 1, language: "EN"){
//                    apiReturn in
//                    let videos = apiReturn.MBDBReturn as! [VideosMDB]
//                    for vid in videos {
//                        print(vid.site)
//                        print(vid.name)
//                    }
        //        }
        //
        //
        //        //backdrops will be null
//        TVSeasonsMDB.season_images(apikey, tvShowId: 60735, seasonNumber: 1, language: "EN"){
//            apiReturn in
//            let images = apiReturn.MBDBReturn as! ImagesMDB
//            print(images.posters[0].iso_639_1)
//            print(images.posters[0].width)
//            print(images.posters[0].file_path)
//
//        }
        
        //The flash season 1, episode 3 information
//        TVEpisodesMDB.episode_number(apikey, tvShowId: 60735, seasonNumber: 1, episodeNumber: 3, language: nil){
//            apiReturn in
//            let episodes = TVEpisodesMDB.init(results: apiReturn.json!)
//            print(episodes.overview)
//            print(episodes.guest_stars[0].character)
//            print(episodes.crew[0].name)
//        }
//        
//       // The flash season 1, episode 3 credits
//        TVEpisodesMDB.episode_credits(apikey, tvShowId: 60735, seasonNumber: 1, episodeNumber: 3){
//            apiReturn in
//            let credits = apiReturn.MBDBReturn as! CastCrewMDB
//            print(credits.crew.count)
//            for i in credits.cast {
//                print(i.credit_id)
//            }
//            for i1 in credits.crew {
//                print(i1.job)
//            }
//        }
//        
//        //Game of thrones season 5 episode 1
//        TVEpisodesMDB.episode_videos(apikey, tvShowId: 1399, seasonNumber: 5, episodeNumber: 1, language: nil){
//            apiReturn in
//           let videos = apiReturn.MBDBReturn as! [VideosMDB]
//            for vid in videos {
//                print(vid.site)
//                print(vid.name)
//            }
//        }
        
        TVEpisodesMDB.episode_images(apikey, tvShowId: 1399, seasonNumber: 1, episodeNumber: 1){
            apiReturn in
            let images = apiReturn.MBDBReturn as! ImagesMDB
            print(images.stills[0].iso_639_1)
            print(images.stills[0].width)
            print(images.stills[0].file_path)

            
        }
    }
    
}
