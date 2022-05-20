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

struct GenresWrapper<T: Codable>: Codable {
    var id: Int?
    var genres: [T]
}

struct KeywordWrapper<T: Codable>: Codable {
    var id: Int?
    var keywords: [T]
}

struct ProfilesWrapper<T: Codable>: Codable {
    var id: Int?
    var profiles: [T]
}

struct TranslationsWrapper<T: Codable>: Codable {
    var id: Int?
    var translations: [T]
}

struct TranslationWrapper<T: Codable>: Codable {
    var id: Int?
    var translations: T
}
