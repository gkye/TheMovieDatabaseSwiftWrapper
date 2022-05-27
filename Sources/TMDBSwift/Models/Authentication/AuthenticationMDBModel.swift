//
//  GuestSession.swift
//  TMDBSwift
//
//  Created by user on 28/01/2019.
//  Copyright © 2019 George. All rights reserved.
//

import Foundation

public struct GuestSessionMDB: Decodable {
    public var success: Bool!
    public var guestSessionId: String!
    public var expiresAt: String!

    enum CodingKeys: String, CodingKey {
        case success
        case guestSessionId = "guest_session_id"
        case expiresAt = "expires_at"
    }
}

public struct RequestTokenMDB: Decodable {
    public var success: Bool!
    public var requestToken: String!
    public var expiresAt: String!

    enum CodingKeys: String, CodingKey {
        case success
        case requestToken = "request_token"
        case expiresAt = "expires_at"
    }
}

public struct SessionMDB: Decodable {
    public var success: Bool!
    public var sessionId: String!

    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}

public struct DeleteSessionMDB: Decodable {
    public var success: Bool!
}
