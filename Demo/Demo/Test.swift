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
  
  
  var images: [Images_MDB]?
  var credits: PersonCreditsCombined!
  
  override func viewDidLoad() {
    
    PersonMDB.personAppendTo(apikey, personID: 1245, append_to: ["images", "combined_credits"]){
      data in
      self.images = Images_MDB.initialize(json: data.json!["images"]["profiles"])
      print(self.images?.count)
      self.credits = PersonCreditsCombined.init(json: data.json!["combined_credits"])
      print(self.credits.tvCredits.cast?.count)
      print(self.credits.movieCredits.cast?.count)
    }
    
  }
  
}