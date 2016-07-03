//
//  MovieReviewMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


public class MovieReviewsMDB: ArrayObject{
  
  public var id: String!
  public var author: String!
  public var content: String!
  public var url: String!
  
  required public init(results: JSON){
    id = results["id"].string
    author = results["author"].string
    content = results["content"].string
    url = results["url"].string
  }
}