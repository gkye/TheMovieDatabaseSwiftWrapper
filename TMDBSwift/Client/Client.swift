//
//  Client.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-11.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation



public struct ClientReturn{
   public var error: NSError?
   public var json: JSON?
 //  public var MBDBReturn: AnyObject?
   public var pageResults: PageResultsMDB?
}

class Client{
   class final func networkRequest(url url: String, parameters: [String : AnyObject], completion: (ClientReturn) -> ()) -> (){
        var cReturn = ClientReturn()
        HTTPRequest.request(url, parameters: parameters){
            rtn in
            if(rtn.error == nil){
                let json = JSON(data: rtn.data!)
                cReturn.error = nil
                cReturn.json = json
                if(json["page"] != nil){
                    cReturn.pageResults = PageResultsMDB.init(results: json)
                }else{
                    cReturn.pageResults = nil
                }
                
                completion(cReturn)
            }else{
                print(rtn.error)
                cReturn.error = rtn.error
                cReturn.json = nil
                cReturn.pageResults = nil
                completion(cReturn)
            }
        }
        
    }
}

class HTTPRequest{
    
    class func request(url: String, parameters: [String: AnyObject],completionHandler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> ()) -> (){
        
        let parameterString = parameters.stringFromHttpParameters()
        let url = NSURL(string: "\(url)?\(parameterString)")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
            if error != nil{
                print("Error -> \(error)")
                completionHandler(data: nil, response: nil, error: error)
            }else{
                completionHandler(data: data, response: response, error: nil)
            }
        }
        
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
        let allowedCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        
        return self.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharacters)
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
            let percentEscapedValue = (String(value)).stringByAddingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joinWithSeparator("&")
    }
}
