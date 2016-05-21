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
        
        FindMDB.find(apikey, id: "nm0644022", external_source: .imdb_id){
            rlts in
            print(rlts.data?.movie_results.count)
            print(rlts.data?.person_results?.count)
            print(rlts.data?.tv_episode_results.count)
            print(rlts.data?.tv_results.count)
            print(rlts.data?.tv_season_results.count)
            
        }
    }
    
}