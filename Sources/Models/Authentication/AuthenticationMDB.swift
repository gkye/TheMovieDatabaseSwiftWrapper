//
//  AuthenticationMDB.swift
//  TMDBSwift
//
//  Created by piars777 on 28/01/2019.
//  Copyright © 2019 George. All rights reserved.
//

import Foundation
public struct AuthenticationMDB {
  
  /// This method will let you create a new guest session. Guest sessions are a type of session that will let a user rate movies and TV shows but not require them to have a TMDb user account. More information about user authentication can be found [here](https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id).
  
  /// Please note, you should only generate a single guest session per user (or device) as you will be able to attach the ratings to a TMDb user account in the future. There is also IP limits in place so you should always make sure it's the end user doing the guest session actions.
  
  /// If a guest session is not used for the first time within 24 hours, it will be automatically deleted.
  ///
  /// - Parameter completion: on complete
  public static func createGuestSession(completion: @escaping (_ clientReturn: ClientReturn, _ guestSession: GuestSessionMDB? ) -> ()) -> (){
    
    Client.createGuestSession { (apiReturn) in
      var data: GuestSessionMDB?
      if let json = apiReturn.json {
        data = GuestSessionMDB(json: json)
      }
      completion(apiReturn, data)
    }
  }
  
  ///Create a temporary request token that can be used to validate a TMDb user login. More details about how this works can be found [here](https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id).
  ///
  /// - Parameter completion: on complete
  public static func createRequestToken(completion: @escaping (_ clientReturn: ClientReturn, _ requestToken: RequestTokenMDB? ) -> ()) -> (){
    
    Client.createRequestToken { (apiReturn) in
      var data: RequestTokenMDB?
      if let json = apiReturn.json {
        data = RequestTokenMDB(json: json)
      }
      completion(apiReturn, data)
    }
  }
  
  /**
   You can use this method to create a fully valid session ID once a user has validated the request token. More information about how this works can be found [here](https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id).
 
  - Parameters:
    - requestToken: 
    - completion: on complete
 */
  public static func createSession(requestToken: String!,completion: @escaping (_ clientReturn: ClientReturn, _ session: SessionMDB? ) -> ()) -> (){
    
    Client.createSession(requestToken: requestToken) { (apiReturn) in
      var data: SessionMDB?
      if let json = apiReturn.json {
        data = SessionMDB(json: json)
      }
      completion(apiReturn, data)
    }
  }
  
  /**
  This method allows an application to validate a request token by entering a username and password.
   Not all applications have access to a web view so this can be used as a substitute.
   Please note, the preferred method of validating a request token is to have a user authenticate the request via the TMDb website.
   If you decide to use this method please use HTTPS
   - Parameters:
       - username: TMDb username
       - password: TMDb password
       - requestToken: requestToken
       - completion: completion
 */
  public static func createRequestTokenWithLogin(username: String!, password: String!, requestToken: String!, completion: @escaping (_ clientReturn: ClientReturn, _ session: RequestTokenMDB? ) -> ()) -> (){
    
    Client.createRequestTokenWithLogin(username: username, password: password, requestToken: requestToken) { (apiReturn) in
      var data: RequestTokenMDB?
      if let json = apiReturn.json {
        data = RequestTokenMDB(json: json)
      }
      completion(apiReturn, data)
    }
  }
  
  /// If you would like to delete (or "logout") from a session, call this method with a valid session ID.
  ///
  /// - Parameters:
  ///   - sessionId: session id
  ///   - completion: completion
  public static func deleteSession(sessionId: String!, completion: @escaping (_ clientReturn: ClientReturn, _ requestToken: DeleteSessionMDB? ) -> ()) -> (){
    
    Client.deleteSession(sessionId: sessionId) { (apiReturn) in
      var data: DeleteSessionMDB?
      if let json = apiReturn.json {
        data = DeleteSessionMDB(json: json)
      }
      completion(apiReturn, data)
    }
  }
}


