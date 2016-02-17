//
//  DiscoverTVVC.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-06.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import UIKit
let apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"; // add as param

class DiscoverTVVC: UIViewController{
    
    var tv = [TVMDB]();
    
    override func viewDidLoad() {
        
        // Basic query
        DiscoverTV.discoverTV(apikey, language: "EN", sort_by: nil, page: 1){
            apiReturn in
            let tvshows = apiReturn.MBDBReturn as! [TVMDB]
            print(tvshows[0].name)
            print(tvshows[0].overview)
            print(tvshows[0].popularity)
        }
        
        //Discover TV in "America/Toronto" timezone, start query on page 3
        DiscoverTV.discoverTV(apikey, language: "EN", sort_by: nil, page: 3, first_air_date_year: nil, first_air_date_gte: nil, first_air_date_lte: nil, air_date_gte: nil, air_date_lte: nil, timezone: "America/Toronto", vote_average_gte: nil, vote_count_gte: nil, with_genres: nil, with_networks: nil){
            apiReturn in
            print(self.tv[0].name)
            print(self.tv[0].popularity)
            print(self.tv[0].first_air_date)
            print(self.tv[0].overview)
        }

// Dicover shows which first aired in 2002
        DiscoverTV.discoverTV(apikey, first_air_date_year: "2002", first_air_date_gte: nil, first_air_date_lte: nil, air_date_gte: nil, air_date_lte: nil, language: "EN", sort_by: nil, page: 1, timezone: nil){
            apiReturn in
            self.tv = apiReturn.MBDBReturn as! [TVMDB]
            print(self.tv[0].name)
            print(self.tv[0].popularity)
            print(self.tv[0].first_air_date)
            print(self.tv[0].overview)
        }

        
        // Discover popular Scifi & Fantasy shows on HBO network
        DiscoverTV.discoverTVWith(apikey, with_genres: TVGenres.ScifiFantasy.rawValue, with_networks: "49", sort_by: DiscoverSortByTV().popularity_desc, language: nil, page: nil){
            apiReturn in
            let tvshows = apiReturn.MBDBReturn as! [TVMDB]
            print(tvshows[0].name)
            print(tvshows[0].overview)
            print(tvshows[0].popularity)
        }

        
    }
}