//
//  TVVC.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-15.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//
//        TVMDB.similar(apikey, tvShowID: 1398, page: 1, language: "en"){
//            apiReturn in
//            if( apiReturn.error == nil){
//                let tv = apiReturn.MBDBReturn as! [TVMDB]
//                if(apiReturn.pageResults?.total_results > 0){
//                    print(tv[0].name)
//                    print(tv[0].genreIds)
//                }
//            }
//        }
//        TVMDB.tv(apikey, tvShowID: 870, language: "en"){
//            apiReturn in
//            if( apiReturn.error == nil){
//                let tv = apiReturn.MBDBReturn as! TVDetailedMDB
//                print(tv.name)
//                print(tv.last_air_date)
//                print(tv.seasons)
//            }
//        }

//        TVMDB.alternativeTitles(apikey, tvShowID: 60735){
//            apiReturn in
//            let altTitles = apiReturn.MBDBReturn as! Alternative_TitlesMDB
//            print(altTitles.titles[0])
//            print(altTitles.id)
//        }

//        TVMDB.credits(apikey, tvShowID: 871){
//            apiReturn in
//            let credits = apiReturn.MBDBReturn as! CastCrewMDB
//            for i in credits.cast {
//                print(i.name)
//            }
//            for i1 in credits.crew {
//                print(i1.job)
//            }
//        }

//            TVMDB.externalIDS(apikey, tvShowID: 1396, language: "en"){
//                apiReturn in
//                let exIds = apiReturn.MBDBReturn as! ExternalIdsMDB
//                print(exIds.freebase_id)
//                print(exIds.imdb_id)
//                print(exIds.tvrage_id)
//                print(exIds.id)
//
//            }

//        TVMDB.images(apikey, tvShowID: 60735, language: "en"){
//            apiReturn in
//            let tvImages = apiReturn.MBDBReturn as! ImagesMDB
//            print(tvImages.backdrops[0].height)
//            print(tvImages.posters[0].file_path)
//        }

//        TVMDB.similar(apikey, tvShowID: 1398, page: 1, language: "en"){
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
//        TVMDB.videos(apikey, tvShowID: 60735, language: "en"){
//            apiReturn in
//            let videos = apiReturn.MBDBReturn as! [VideosMDB]
//            for i in videos {
//                print(i.site)
//            }
//        }

//        TVMDB.latest(apikey){
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

//        TVMDB.ontheair(apikey, page: 1, language: "en"){
//            apiReturn in
//            let tv = apiReturn.MBDBReturn as! [TVMDB]
//            print(tv[0].name)
//            print(tv[0].popularity)
//            print(tv[0].first_air_date)
//            print(tv[0].overview)
//            print(apiReturn.pageResults?.total_pages)
//        }
//        TVMDB.airingtoday(apikey, page: 2, language: "en", timezone: "Asia/Baku"){
//            apiReturn in
//            let tv = apiReturn.MBDBReturn as! [TVMDB]
//            print(tv[0].name)
//            print(tv[0].popularity)
//            print(tv[0].first_air_date)
//            print(tv[0].overview)
//            print(apiReturn.pageResults?.total_pages)
//        }
//        TVMDB.toprated(apikey, page: 1, language: "en"){
//            apiReturn in
//            let tv = apiReturn.MBDBReturn as! [TVMDB]
//            print(tv[0].name)
//            print(tv[0].popularity)
//            print(tv[0].first_air_date)
//            print(tv[0].overview)
//        }


//        TVMDB.popular(apikey, page: 1, language: "en"){
//            apiReturn in
//            let tv = apiReturn.MBDBReturn as! [TVMDB]
//            print(tv[0].name)
//            print(tv[0].popularity)
//            print(tv[0].first_air_date)
//            print(tv[0].overview)
//        }


