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

    var videos: [VideosMDB]?
    var reviews: [MovieReviewsMDB]?
    MovieMDB.movieAppendTo(apikey, movieID: 49026, append_to: ["videos", "reviews"]){
      data in
      if let json = data.json{
        videos = VideosMDB.initialize(json: json["videos"]["results"])
        reviews = MovieReviewsMDB.initialize(json: json["reviews"]["results"])
      }
      print(videos)
      print(reviews)
    }
    
  }
  
}