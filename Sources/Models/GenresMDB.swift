//
//  GenresMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


public enum GenresListType: String{
  case tv, movie
}

open class GenresMDB: KeywordsMDB{
  
  
  ///Get the list of tv or movie genres.
  open class func genres(_ api_key: String!, listType: GenresListType, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [GenresMDB]?) -> ()) -> (){
    Client.Genres(api_key, listType: listType.rawValue, language: language, genreId: 0, page: nil, include_all_movies: nil, include_adult: nil, movieList: false){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, GenresMDB.initialize(json: apiReturn.json!["genres"]))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
  
  ///Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
  open class func genre_movies(_ api_key: String!, genreId: Int, include_adult_movies: Bool, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ data: [MovieMDB]?) -> ()) -> (){
    Client.Genres(api_key, listType: "movies", language: language, genreId: genreId, page: nil, include_all_movies: true, include_adult: nil, movieList: true){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn, MovieMDB.initialize(json: apiReturn.json!["results"]))
      }else{
        completion(apiReturn, nil)
      }
    }
  }
  
}
