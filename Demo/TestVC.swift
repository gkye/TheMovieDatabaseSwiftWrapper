//
//  TestVC.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import UIKit

class Test: UIViewController{
    
    override func viewDidLoad() {
        //        NetworksMDB.networks(apikey, networkId: 49){
        //            apiReturn in
        //            let net = apiReturn.MBDBReturn as! NetworksMDB
        //            print(net.id)
        //            print(net.name)
        //        }
        //
        
        //        ReviewsMDB.review(apikey, reviewId: "5013bc76760ee372cb00253e"){
        //            apiReturn in
        //            let rev = apiReturn.MBDBReturn as! ReviewsMDB
        //            print(rev.id)
        //            print(rev.content)
        //            print(rev.iso_639_1)
        //            print(rev)
        //        }
        //        TVSeasonsMDB.externalIDS(apikey, tvShowId: 1396, seasonNumber: 1, language: "en"){
        //            apiReturn in
        //            let ids = apiReturn.MBDBReturn as! ExternalIdsMDB
        //            print(ids.tvdb_id)
        //            print(ids.freebase_mid)
        //            print(ids.freebase_id)
        //        }
        
        //
        //
        //        KeywordsMDB.tv_keywords(apikey, tvShowID: 1398){
        //            apiReturn in
        //            let keywords = apiReturn.MBDBReturn as! [KeywordsMDB]
        //            if(keywords.count > 0){
        //                for i in keywords {
        //                    print(i.name)
        //                }
        //            }
        //        }
        //
        
        //        ConfigurationMDB.configuration(apikey){
        //            apiReturn in
        //            let config = apiReturn.MBDBReturn as! ConfigurationMDB
        //            print(config.base_url)
        //            print(config.secure_base_url)
        //            print(config.backdrop_sizes)
        //            print(config.profile_sizes)
        //        }
        
        //        NetworksMDB.networks(apikey, networkId: 200){
        //            netwrk in
        //            let network = netwrk.MBDBReturn as! NetworksMDB
        //            print(network.id)
        //            print(network.name)
        //        }
        
        //        CreditsMDB.credits(apikey, creditID: "5256c98419c2956ff604fd2c", language: "en"){
        //            credits in
        //            let credit = credits.MBDBReturn as! CreditsMDB
        //            if(credit.media.episodes.count > 0){
        //                print(credit.media.episodes[0].overview)
        //                print(credit.media.episodes[0].season_number)
        //                print(credit.media.episodes[0].air_date)
        //            }
        //            if(credit.media.seasons.count > 0){
        //                print(credit.media.seasons[0].season_number)
        //                print(credit.media.seasons[0].poster_path)
        //                print(credit.media.seasons[0].air_date)
        //            }
        //            print(credit.media_Type)
        //            print(credit.department)
        //            print(credit.job)
        //            print(credit.id)
        //            print(credit.person.name)
        //        }
        
        
//        KeywordsMDB.keyword(apikey, keywordId: 1721){
//            keyword in
//            let keywords = keyword.MBDBReturn as! KeywordsMDB
//            print(keywords.id)
//            print(keywords.name)
//        }
//        
//        KeywordsMDB.keyword_movies(apikey, keywordId: 1721, page: 1, language: "en"){
//            apiReturn in
//            let movie = apiReturn.MBDBReturn as! [MovieMDB]
//            print(movie[0].title)
//            print(movie[0].original_title)
//            print(movie[0].release_date)
//            print(movie[0].overview)
//        }
        
//        MovieMDB.keywords(apikey, movieID: 1721){
//            apiReturn in
//            let keywords = apiReturn.MBDBReturn as! [KeywordsMDB]
//            for keyword in keywords{
//                print(keyword.id)
//                print(keyword.name)
//            }
//        }
        
//        TVMDB.keywords(apikey, tvShowID: 1396){
//            apiReturn in
//            let keywords = apiReturn.MBDBReturn as! [KeywordsMDB]
//            for keyword in keywords{
//                print(keyword.id)
//                print(keyword.name)
//            }
//        }
        
        
        TVMDB.content_ratings(apikey, tvShowID: 1396){
            apiReturn in
            let ratings = apiReturn.MBDBReturn as! [Content_RatingsMDB]
            for rating in ratings {
                print(rating.iso_3166_1)
                print(rating.rating)
            }
        }
        
    }
    
    
}