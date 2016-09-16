//
//  MovieReviewMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-03-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


open class MovieReviewsMDB: ArrayObject{
  
  open var id: String!
  open var author: String!
  open var content: String!
  open var url: String!
  
  required public init(results: JSON){
    id = results["id"].string
    author = results["author"].string
    content = results["content"].string
    url = results["url"].string
  }
}
