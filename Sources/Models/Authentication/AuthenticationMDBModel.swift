//
//  GuestSession.swift
//  TMDBSwift
//
//  Created by user on 28/01/2019.
//  Copyright © 2019 George. All rights reserved.
//

import Foundation
public struct GuestSessionMDB{
  public var success: Bool!
  public var guestSessionId: String!
  public var expiresAt: String!
  
  public init(json: JSON){
    success = json["success"].boolValue
    guestSessionId = json["guest_session_id"].string
    expiresAt = json["expires_at"].string
  }
}

public struct RequestTokenMDB{
  public var success: Bool!
  public var requestToken: String!
  public var expiresAt: String!
  
  public init(json: JSON){
    success = json["success"].boolValue
    requestToken = json["request_token"].string
    expiresAt = json["expires_at"].string
  }
}

public struct SessionMDB{
  public var success: Bool!
  public var sessionId: String!
  
  public init(json: JSON){
    success = json["success"].boolValue
    sessionId = json["session_id"].string
  }
}

public struct DeleteSessionMDB{
  public var success: Bool!
  
  public init(json: JSON){
    success = json["success"].boolValue
  }
}
