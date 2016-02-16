////
////  ViewController.swift
////  MovieDbWrapper
////
////  Created by George on 2016-02-04.
////  Copyright © 2016 GeorgeKye. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//class ViewController: UIViewController {
//    
//    var tv = [DiscoverTV]();
//   var movie = [DiscoverMovie]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //Basic discover query
//        Discover.discover(apikey, discoverType: "tv", language: "en"){
//            apiReturn in
//            self.tv = apiReturn.MBDBReturn as! [DiscoverTV]
//            print(self.tv[0].id)
//            print(self.tv[0].name)
//            print(self.tv[0].overview)
//        }
//
//        Discover.discover(apikey, discoverType: "movie", language: "en", sort_by: DiscoverSortByMovie().vote_average_desc, page: nil){
//            apiReturn in
//            self.movie = apiReturn.MBDBReturn as! [DiscoverMovie]
//            print(self.movie[0].title)
//          
//        }
//
//
//       // Discover top french Animation and WarPolitics shows, unsorted. sort_by (optional). Genre ids available on http://docs.themoviedb.apiary.io/#reference/genres/genretvlist/get and http://docs.themoviedb.apiary.io/#reference/genres/genremovielist/get
//        Discover.discover(apikey, discoverType: "tv", language: "fr", sort_by: nil, page: nil, with_genres: "\(TVGenres.Animation.rawValue),\(TVGenres.WarPolitics.rawValue)"){
//            apiReturn in
//            if(apiReturn.error == nil){
//                self.tv = apiReturn.MBDBReturn as! [DiscoverTV]
//                print(self.tv[0].name)
//                print(self.tv[0].first_air_date)
//                print(self.tv[0].overview)
//            }
//        }
//
//      //  Disocver movies  with genres Crime 80) OR Drama(18) with vote average greater than 5 and vote count greater than 7, sort by vote count desc (Highest to lowest)
//        Discover.discover(apikey, discoverType: "movie", language: "en", sort_by: DiscoverSortBy().popularity_desc, page: 1, with_genres: "\(MovieGenres.Crime.rawValue)|\(MovieGenres.Drama.rawValue)" , vote_average_gte: 7, vote_count_gte: 7){
//            apiReturn in
//            self.movie = apiReturn.MBDBReturn as! [DiscoverMovie]
//            print(self.movie[0].title)
//            print(self.movie[0].original_title)
//            print(self.movie[0].release_date)
//            print(self.movie[5].overview)
//        }

//    }
// 
//    
//}