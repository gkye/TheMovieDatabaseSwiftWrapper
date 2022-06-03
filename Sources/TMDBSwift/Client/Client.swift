//
//  Client.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-11.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct ClientReturn {
    public var error: NSError?
    public var data: Data?
}

public struct MDBReturn {
    public var error: Error?
    public var data: Data?
    public var response: URLResponse?

    init(err: Error?, data: Data?, reponse: URLResponse?) {
        error = err
        self.data = data
        self.response = reponse
    }
}

struct Client {
    static func networkRequest(url: String, httpMethod: String = "GET", parameters: [String: AnyObject], completion: @escaping (ClientReturn) -> Void) {
        var apiReturn = ClientReturn()
        guard let apikey = TMDBConfig.apikey else {
            fatalError("NO API is set. Set your api using TMDBConfig.api = YOURKEY")
        }
        var params = parameters
        params["api_key"] = apikey as AnyObject
        HTTPRequest.request(url, httpMethod: httpMethod, parameters: params) { (data, _, error) in
            if let data = data {
                apiReturn.data = data
            }
            apiReturn.error = error as NSError?
            completion(apiReturn)
        }
    }

    static func apiRequest(url: String, parameters: [String: AnyObject], completion: @escaping (MDBReturn) -> Void) {
        HTTPRequest.request(url, parameters: parameters) { (data, response, error) in
            let apiReturn = MDBReturn(err: error, data: data, reponse: response)
            completion(apiReturn)
        }
    }
}

class HTTPRequest {
   static func request(_ url: String, httpMethod: String = "GET", parameters: [String: AnyObject], completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let parameterString = parameters.stringFromHttpParameters()
        let urlString = url + "?" + parameterString
        let requestURL = URL(string: urlString)!
        let request = NSMutableURLRequest(url: requestURL)
        request.httpMethod = httpMethod
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            DispatchQueue.main.async(execute: { () -> Void in
                if error != nil {
                    completionHandler(nil, nil, error as Error?)
                } else {
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
        let parameterArray = self.map { arr -> String in
            let key = arr.key
            let value = arr.value
            let percentEscapedKey = (key as? String)?.stringByAddingPercentEncodingForURLQueryValue() ?? ""
            let percentEscapedValue = (String(describing: value)).stringByAddingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }

        return parameterArray.joined(separator: "&")
    }
}
