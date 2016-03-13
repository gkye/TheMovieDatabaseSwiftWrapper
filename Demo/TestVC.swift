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
        
        ListsMDB.lists(apikey, listId: "5316bbcd92514158d20015b5"){
            apiReturn in
            let list = apiReturn.data!
            print(list.name)
            print(list.favorite_count)
            print(list.created_by)
            print(list.description)
            print(list.items[0].overview)
            print(list.items[0].title)
        }
    }
    
    
    
}


