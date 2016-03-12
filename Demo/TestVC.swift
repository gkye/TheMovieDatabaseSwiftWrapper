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
        
//        PersonMDB.latest(apikey){
//            personRtn in
//            let person = personRtn.MBDBReturn as! PersonMDB
//            print(person.name)
//            print(person.also_known_as)
//            print(person.biography)
//            print(person.birthday)
//            print(person.homepage)
//        }
//        
        
        //FIND
//        FindMDB.find(apikey, id: "m/0kfv9", external_source: ExternalIdTypes.freebase_mid){
//            findResults in
//            
//            let find = findResults.MBDBReturn as! FindMDB
//            print(findResults.json)
//            print(find.tv_results![0].name)
//            print(find.movie_results)
//            print(find.tv_season_results)
//            print(find.tv_episode_results)
//        }
        
//        ConfigurationMDB.configuration(apikey){
//            configs in
//            let configData = configs.configurationData
//            print(configData.base_url)
//            print(configData.secure_base_url)
//            print(configData.backdrop_sizes)
//            print(configData.still_sizes)
//            print(configData.logo_sizes)
//        }
//        
//        CollectionMDB.Collection(apikey, collectionId: 10, language: "en"){
//            collectionData in
//           let data = collectionData.collectionMDBData!
//            print(data.overview)
//            print(data.name)
//            print(data.collectionItems[0].original_title)
//            print(data.collectionItems[0].overview)
//        }
        
        CollectionMDB.CollectionImages(apikey, collectionId: 10, language: "en"){
            collectionData in
            let data = collectionData.collectionImagesMDBData
            print(data?.posters[0].file_path)
            //print(data?.stills[0].file_path)
            print(data?.backdrops[0].file_path)
        }
    
    }
    
    
}