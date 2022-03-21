//
//  Client_Authentication.swift
//  TMDBSwift
//
//  Created by piars777 on 28/01/2019.
//  Copyright © 2019 George. All rights reserved.
//

import Foundation
extension Client{
  static func createGuestSession(completion: @escaping (ClientReturn) -> ()) -> (){
    
    let parameters: [String : AnyObject] = [:]
    
    let url = TMDBConfig.apiUrl + "/authentication/guest_session/new"
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  static func createRequestToken(completion: @escaping (ClientReturn) -> ()) -> (){
    
    let parameters: [String : AnyObject] = [:]
    
    let url = TMDBConfig.apiUrl + "/authentication/token/new"
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  static func createSession(requestToken: String!, completion: @escaping (ClientReturn) -> ()) -> (){
    
    var parameters: [String : AnyObject] = [:]
    
    parameters["request_token"] = requestToken as AnyObject?
    
    let url = TMDBConfig.apiUrl + "/authentication/session/new"
    networkRequest(url: url, httpMethod: "POST", parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  
  static func createRequestTokenWithLogin(username: String!, password: String!, requestToken: String!, completion: @escaping (ClientReturn) -> ()) -> (){
    
    var parameters: [String : AnyObject] = [:]
    
    parameters["username"] = username as AnyObject?
    parameters["password"] = password as AnyObject?
    parameters["request_token"] = requestToken as AnyObject?
    
    let url = TMDBConfig.apiUrl + "/authentication/token/validate_with_login"
    networkRequest(url: url, httpMethod: "POST", parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  
  static func deleteSession(sessionId: String!, completion: @escaping (ClientReturn) -> ()) -> (){
    
    var parameters: [String : AnyObject] = [:]
    
    parameters["session_id"] = sessionId as AnyObject?
    
    let url = TMDBConfig.apiUrl + "/authentication/session"
    networkRequest(url: url, httpMethod: "DELETE", parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
}
