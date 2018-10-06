//
//  ArrayWrapper.swift
//  TMDBSwift-iOS
//
//  Created by Martin P. on 2018-09-29.
//  Copyright © 2018 George. All rights reserved.
//

struct ResultsWrapper<T: Codable>: Codable {
  var id: Int?
  var results: [T]
}

struct ResponseWrapper: Codable {
  var videos: ResultsWrapper<VideosMDB>?
  var reviews: ResultsWrapper<MovieReviewsMDB>?
}
