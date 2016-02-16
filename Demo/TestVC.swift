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
        //
        //      
        //
        //        KeywordMDB.tv_keywords(apikey, tvShowID: 1398){
        //            apiReturn in
        //            let keywords = apiReturn.MBDBReturn as! [KeywordMDB]
        //            if(keywords.count > 0){
        //                for i in keywords {
        //                    print(i.name)
        //                }
        //            }
        //        }
        //
    
        ConfigurationMDB.configuration(apikey){
            apiReturn in
            let config = apiReturn.MBDBReturn as! ConfigurationMDB
            print(config.base_url)
            print(config.backdrop_sizes)
            print(config.profile_sizes)
        }
        
    }
    
        
}