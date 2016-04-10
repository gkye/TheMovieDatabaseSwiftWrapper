//
//  ViewController.swift
//  Demo
//
//  Created by George on 2016-04-07.
//  Copyright © 2016 George. All rights reserved.
//

import UIKit
import TMDBSwift


let apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TVMDB.toprated(apikey, page: 1, language: "en"){
            apiReturn in
            let tv = apiReturn.data!
            print(tv[0].name)
            print(tv[0].popularity)
            print(tv[0].first_air_date)
            print(tv[0].overview)
        }
        
        TVMDB.popular(apikey, page: 1, language: "en"){
            apiReturn in
            let tv = apiReturn.data!
            print(tv[0].name)
            print(tv[0].popularity)
            print(tv[0].first_air_date)
            print(tv[0].overview)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

