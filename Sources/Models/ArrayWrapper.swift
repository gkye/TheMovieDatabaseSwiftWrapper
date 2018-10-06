//
//  ArrayWrapper.swift
//  TMDBSwift-iOS
//
//  Created by Martin P. on 2018-09-29.
//  Copyright © 2018 George. All rights reserved.
//

struct ArrayWrapper<T: Codable>: Codable {
  var id: Int?
  var results: [T]
}

struct VideosWrapper: Codable {
  var videos: ArrayWrapper<VideosMDB>
}

struct ReviewsWrapper: Codable {
  var reviews: ArrayWrapper<MovieReviewsMDB>
}
