//
//  ClientReturn+decode.swift
//  TMDBSwift-iOS
//
//  Created by Martin Pfundmair on 2018-10-07.
//  Copyright © 2018 George. All rights reserved.
//

import Foundation

extension ClientReturn {

    /// Decodes standard tmdb response data (keypath `results`) into array of expected model type
    ///
    /// - Returns: optional array of Codable expected model type
    func decodeResults<T: Codable>() -> [T]? {
        if let data = data,
           let decodedWrapper = try? JSONDecoder().decode(ResultsWrapper<T>.self, from: data) {
            return decodedWrapper.results
        }
        return nil
    }

    func decode<T: Codable>() -> T? {
        if let data = data,
           let decoded = try? JSONDecoder().decode(T.self, from: data) {
            return decoded
        }
        return nil
    }
}
