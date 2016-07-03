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
    MovieMDB.movie(apikey, movieID: 7984, language: "en"){
      apiReturn in
      let movie = apiReturn.data!
      print(movie.title)
      print(movie.revenue)
      print(movie.genres[0].name)
    }
    
  }
  
}