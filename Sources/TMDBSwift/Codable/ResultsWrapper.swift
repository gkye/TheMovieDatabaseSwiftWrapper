//
//  ArrayWrapper.swift
//  TMDBSwift-iOS
//
//  Created by Martin P. on 2018-09-29.
//  Copyright © 2018 George. All rights reserved.
//

struct ResultsWrapper<T: Decodable>: Decodable {
    var id: Int?
    var results: [T]
}

struct GenresWrapper<T: Decodable>: Decodable {
    var id: Int?
    var genres: [T]
}

struct KeywordWrapper<T: Decodable>: Decodable {
    var id: Int?
    var keywords: [T]
}

struct ProfilesWrapper<T: Decodable>: Decodable {
    var id: Int?
    var profiles: [T]
}

struct TranslationsWrapper<T: Decodable>: Decodable {
    var id: Int?
    var translations: [T]
}

struct TranslationWrapper<T: Decodable>: Decodable {
    var id: Int?
    var translations: T
}
