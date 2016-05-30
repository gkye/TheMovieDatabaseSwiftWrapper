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
    
    SearchMDB.movie(apikey, query: "Superman", language: "en", page: 1, includeAdult: true, year: nil, primaryReleaseYear: nil){
      mvs in
      print(mvs.movie?[0].title)
      print(mvs.movie?[0].overview)
    }
    
//    SearchMDB.company(apikey, query: "Sony", page: 1){
//      cp in
//      print(cp.company?[0].id)
//      print(cp.company?[0].logo_path)
//      print(cp.company?[0].name)
//    }
//    
//    SearchMDB.collection(apikey, query: "Superman", page: 1, language: "en"){
//      cl in
//      print(cl.collection?[0].id)
//      print(cl.collection?[0].name)
//      print(cl.collection?[0].backdrop_path)
//    }
//    
//    SearchMDB.keyword(apikey, query: "Fight", page: 1){
//      wrds in
//      print(wrds.keyword?[0].id)
//      print(wrds.keyword?[0].name)
//    }
//    
//    SearchMDB.list(apikey, query: "Action", page: 1, include_adult: true){
//      list in
//      print(list.list?[0].description)
//      print(list.list?[0].name)
//    }
//    
//    SearchMDB.person(apikey, query: "Brad Pitt", page: 1, includeAdult: true){
//      ppl in
//      print(ppl.person?[0].name)
//      print(ppl.person?[0].known_for.movies?.count)
//      print(ppl.person?[0].known_for.tvShows?.count)
//    }
//    
//    SearchMDB.tv(apikey, query: "Breaking Ba", page: 1, language: "en", first_air_date_year: nil){
//      data in
//      print(data.tvShows?[0].name)
//      print(data.tvShows?[0].overview)
//      print(data.tvShows?[0].popularity)
//    }
    
    
  }
  
}