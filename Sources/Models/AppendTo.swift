//
//  AppendTo.swift
//  TMDBSwift
//
//  Created by George Kye on 2017-11-29.
//  Copyright © 2017 George. All rights reserved.
//

import Foundation

public enum AppendToResponse: String {
  case alternative_titles, images, videos, keywords, release_dates, translations, lists
  case recommendationsMovies = "recommendations"
  case similarMovies = "similar"
  case reviews
  case movieCredits = "credits"
}

public enum AppendToResponseData{
  case alternative_titles(Alternative_TitlesMDB)
  case movieCredits(MovieCreditsMDB?)
  case keywords([KeywordsMDB])
  case release_dates([MovieReleaseDatesMDB])
  case images(ImagesMDB?)
  case videos([VideosMDB])
  case movieReviews([MovieReviewsMDB])
  case translations(TranslationsMDB?)
  case similarMovies([MovieMDB])
  case recommendationsMovies([MovieMDB])
  case lists([ListsMDB])
  
  
  /// Decode object for `append_to_response`s added to request. More info available here https://developers.themoviedb.org/3/getting-started/append-to-response
  ///
  /// - Parameters:
  ///   - json: JSON returns by request
  ///   - types: Types to be initialized and added to completion of request
  /// - Returns: an array of `append_to_response`s
  static func decodeAppenedTypes(json: JSON, types: [AppendToResponse]) -> [AppendToResponseData]{
    var appenedData = [AppendToResponseData]()
    for type in types{
      guard let json = json.json(forKey: type.rawValue) else { continue }
      switch type {
      case .alternative_titles:
        appenedData.append(.alternative_titles(Alternative_TitlesMDB(results: json)))
      case .movieCredits:
        appenedData.append(.movieCredits(MovieCreditsMDB(results: json)))
      case .keywords:
        appenedData.append(.keywords(KeywordsMDB.initialize(json: json)))
      case .release_dates:
        appenedData.append(.release_dates(MovieReleaseDatesMDB.initialize(json: json)))
      case .images:
        appenedData.append(.images(ImagesMDB(results: json)))
      case .videos:
        appenedData.append(.videos(VideosMDB.initialize(json: json)))
      case .reviews:
        appenedData.append(.movieReviews(MovieReviewsMDB.initialize(json: json)))
      case .translations:
        appenedData.append(.translations(TranslationsMDB.init(results: json)))
      case .similarMovies:
        appenedData.append(.similarMovies(MovieMDB.initialize(json: json)))
      case .recommendationsMovies:
        appenedData.append(.recommendationsMovies(MovieMDB.initialize(json: json)))
      case .lists:
        appenedData.append(.lists(ListsMDB.initialize(json: json)))
      }
    }
    return appenedData
  }
}

fileprivate extension JSON {
  func json(forKey key: String) -> JSON? {
    if self[key]["results"].exists(){
      return self[key]["results"]
    }else{
      return self[key]
    }
  }
}
