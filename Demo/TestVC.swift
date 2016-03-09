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
        
        PersonMDB.latest(apikey){
            personRtn in
            let person = personRtn.MBDBReturn as! PersonMDB
            print(person.name)
            print(person.also_known_as)
            print(person.biography)
            print(person.birthday)
            print(person.homepage)
        }
        
       
        
        
    }
    
    
}