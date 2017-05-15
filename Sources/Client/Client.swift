//
//  Client.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation



public struct ClientReturn{
  public var error: NSError?
  public var json: JSON?
  //  public var MBDBReturn: AnyObject?
  public var pageResults: PageResultsMDB?
}

struct Client{
  static func networkRequest(url: String, parameters: [String : AnyObject], completion: @escaping (ClientReturn) -> ()) -> (){
    var cReturn = ClientReturn()
    HTTPRequest.request(url, parameters: parameters){
      rtn in
      if rtn.2 == nil{
        let json = try! JSON(data: rtn.0!)
        cReturn.error = nil
        cReturn.json = json
        if(json["page"].exists()){
          cReturn.pageResults = PageResultsMDB.init(results: json)
        }else{
          cReturn.pageResults = nil
        }
      }else{
        cReturn.error = rtn.2 as NSError?
        cReturn.json = nil
        cReturn.pageResults = nil
      }
      
      completion(cReturn)

    }
    
  }
}

class HTTPRequest{
  
  class func request(_ url: String!, parameters: [String: AnyObject],completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()) -> (){
    
    let parameterString = parameters.stringFromHttpParameters()
    let urlString = url + "?" + parameterString
    let requestURL = URL(string: urlString)!
    let request = NSMutableURLRequest(url: requestURL)
    request.httpMethod = "GET"
    request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
      DispatchQueue.main.async(execute: { () -> Void in
        if error != nil{
          print("Error -> \(String(describing: error))")
          completionHandler(nil, nil, error as Error?)
        }else{
          completionHandler(data, response, nil)
        }
      })
      
    })
    
    
    task.resume()
  }
}

extension String {
  
  /// Percent escapes values to be added to a URL query as specified in RFC 3986
  ///
  /// This percent-escapes all characters besides the alphanumeric character set and "-", ".", "_", and "~".
  ///
  /// http://www.ietf.org/rfc/rfc3986.txt
  ///
  /// :returns: Returns percent-escaped string.
  
  func stringByAddingPercentEncodingForURLQueryValue() -> String? {
    let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
    
    return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
  }
  
}

extension Dictionary {
  
  /// Build string representation of HTTP parameter dictionary of keys and objects
  ///
  /// This percent escapes in compliance with RFC 3986
  ///
  /// http://www.ietf.org/rfc/rfc3986.txt
  ///
  /// :returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
  
  func stringFromHttpParameters() -> String {
    let parameterArray = self.map { (key, value) -> String in
      let percentEscapedKey = (key as! String).stringByAddingPercentEncodingForURLQueryValue()!
      let percentEscapedValue = (String(describing: value)).stringByAddingPercentEncodingForURLQueryValue()!
      return "\(percentEscapedKey)=\(percentEscapedValue)"
    }
    
    return parameterArray.joined(separator: "&")
  }
}
