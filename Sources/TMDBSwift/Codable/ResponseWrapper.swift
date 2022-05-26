//
//  ResponseWrapper.swift
//  TMDBSwift-iOS
//
//  Created by Martin Pfundmair on 2018-10-07.
//  Copyright © 2018 George. All rights reserved.
//

struct ResponseWrapper: Codable {
    var videos: ResultsWrapper<VideosMDB>?
    var reviews: ResultsWrapper<MovieReviewsMDB>?
}
