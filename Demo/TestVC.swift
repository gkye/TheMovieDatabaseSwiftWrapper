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
//
//        NetworksMDB.networks(apikey, networkId: 200){
//            netwrk in
//            let network = netwrk.data!
//            print(network.id)
//            print(network.name)
//        }
     
        
        KeywordsMDB.keyword_movies(apikey, keywordId: 1721, page: 1, language: "en"){
            apiReturn in
            let movie = apiReturn.data!
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
    }
    
    
    
}


