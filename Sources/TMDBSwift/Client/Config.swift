//
//  Config.swift
//  TMDBSwift
//
//  Created by Evolution in DesignZ on 2017-11-21.
//  Copyright © 2017 George. All rights reserved.
//

import Foundation

/// A structure representing the API configuration for the current session.
public struct TMDBConfig {
    /// API key to be used for queries.
    public static var apikey: String?

    /// The language provided to all network requests, defaults to ``SupportedLanguage.en``.
    public static var language: Language = .en

    /// API base url.
    static var apiUrl = "https://api.themoviedb.org/3"

    /// API scheme.
    static let apiScheme = "https"

    /// API host.
    static let apiHost = "api.themoviedb.org"
}
