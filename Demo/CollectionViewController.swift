//
//  CollectionViewController.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import UIKit

class CollectionVC: UIViewController{
    
    override func viewDidLoad() {
        //        CollectionMDB.Collection(apikey, collectionId: 86311, language: "EN"){
        //            apiReturn in
        //            if apiReturn.error == nil{
        //                let collection = apiReturn.MBDBReturn as! CollectionMDB
        //                print(collection.name)
        //                print(collection.overview)
        //                print(collection.collectionItems[0].title)
        //                print(collection.collectionItems[0].overview)
        //            }
        //        }
        //        CollectionMDB.CollectionImages(apikey, collectionId: 10, language: "EN"){
        //            apiReturn in
        //            if(apiReturn.error == nil){
        //                let images = apiReturn.MBDBReturn as! ImagesMDB
        //                print(images.backdrops[0].file_path)
        //                print(images.posters[0].file_path)
        //            }
        //        }
        
        CompanyMDB.companyInfo(apikey, companyId: 2){
            apiReturn in
            let companyInfo = apiReturn.MBDBReturn as! CompanyMDB
            print(companyInfo.name)
            print(companyInfo.description)
            print(companyInfo.parent_company?.logo_path)
            print(companyInfo.parent_company?.name)
        }
        
        CompanyMDB.companyMovies(apikey, companyId: 2, language: "EN", page: 1){
            apiReturn in
            let companyMovies = apiReturn.MBDBReturn as! [MovieMDB]
            print(companyMovies[0].title)
            print(companyMovies[0].original_title)
            print(companyMovies[0].release_date)
            print(companyMovies[0].overview)
            
        }
    }
}
