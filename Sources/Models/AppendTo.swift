//
//  AppendTo.swift
//  TMDBSwift
//
//  Created by George Kye on 2017-11-29.
//  Copyright © 2017 George. All rights reserved.
//

import Foundation

public enum AppendedDataType: String {
  case video, review
}

public enum AppendedData{
  case videos([VideosMDB])
  case reviews([ReviewsMDB])
  
  //REMINDME: Add all types to this
  static func decodeAppenedTypes(json: JSON, types: [AppendedDataType]) -> [AppendedData]{
    var appenedData = [AppendedData]()
    for type in types{
      guard let json = json[type.rawValue].dictionary?.first?.value else { return appenedData }
      switch type {
      case .video:
        appenedData.append(.videos(VideosMDB.initialize(json: json)))
      case .review:
        appenedData.append(.reviews(ReviewsMDB.initialize(json: json)))
      }
    }
    return appenedData
  }
}

