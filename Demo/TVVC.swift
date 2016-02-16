//
//  TVVC.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

//        TVMDB.tv_similar(apikey, tvShowID: 1398, page: 1, language: "en"){
//            apiReturn in
//            if( apiReturn.error == nil){
//                let tv = apiReturn.MBDBReturn as! [TVMDB]
//                if(apiReturn.pageResults?.total_results > 0){
//                    print(tv[0].name)
//                    print(tv[0].genreIds)
//                }
//            }
//        }
//
//        TVMDB.tv_latest(apikey){
//            apiReturn in
//            if( apiReturn.error == nil){
//                let tv = apiReturn.MBDBReturn as! TVDetailedMDB
//                print(tv.name)
//                print(tv.last_air_date)
//                print(tv.seasons)
//                print(tv.episode_run_time)
//                print(tv.createdBy)
//            }
//        }
//
//        TVMDB.tv_credits(apikey, tvShowID: 871){
//            apiReturn in
//            let credits = apiReturn.MBDBReturn as! CastCrewMDB
//            for i in credits.cast {
//                print(i.name)
//            }
//            for i1 in credits.crew {
//                print(i1.job)
//            }
//        }
//
//        TVMDB.tv_videos(apikey, tvShowID: 60735, language: "en"){
//            apiReturn in
//            let videos = apiReturn.MBDBReturn as! [VideosMDB]
//            for i in videos {
//                print(i.site)
//            }
//        }
//
//
//
//TVMDB.tv_images(apikey, tvShowID: 60735, language: "en"){
//    apiReturn in
//    let tvImages = apiReturn.MBDBReturn as! ImagesMDB
//    print(tvImages.backdrops[0].height)
//    print(tvImages.posters[0].file_path)
//}

//TVMDB.tv_popular(apikey, page: 1, language: "en"){
//            apiReturn in
//            let tv = apiReturn.MBDBReturn as! [TVMDB]
//            print(tv[0].name)
//            print(tv[0].popularity)
//            print(tv[0].first_air_date)
//            print(tv[0].overview)
//        }
//
//        TVMDB.tv_toprated(apikey, page: 1, language: "en"){
//            apiReturn in
//            let tv = apiReturn.MBDBReturn as! [TVMDB]
//            print(tv[0].name)
//            print(tv[0].popularity)
//            print(tv[0].first_air_date)
//            print(tv[0].overview)
//        }
//
//
//        TVMDB.tv_ontheair(apikey, page: 1, language: "en"){
//            apiReturn in
//            let tv = apiReturn.MBDBReturn as! [TVMDB]
//            print(tv[0].name)
//            print(tv[0].popularity)
//            print(tv[0].first_air_date)
//            print(tv[0].overview)
//            print(apiReturn.pageResults?.total_pages)
//        }
//
//        TVMDB.tv(apikey, tvShowID: 870, language: "en"){
//            apiReturn in
//            if( apiReturn.error == nil){
//                let tv = apiReturn.MBDBReturn as! TVDetailedMDB
//                print(tv.name)
//                print(tv.last_air_date)
//                print(tv.seasons)
//            }
//        }