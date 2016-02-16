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
        CollectionMDB.Collection(apikey, collectionId: 86311, language: "EN"){
            apiReturn in
            if apiReturn.error == nil{
                let collection = apiReturn.MBDBReturn as! CollectionMDB
                print(collection.name)
                print(collection.overview)
                print(collection.collectionItems[0].title)
                print(collection.collectionItems[0].overview)
            }
            
        }
    }
}
