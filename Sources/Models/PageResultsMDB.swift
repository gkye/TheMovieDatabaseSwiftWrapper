//
//  PageResultsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-14.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


public struct PageResultsMDB{
  
  public var page: Int!
  public var total_results: Int!
  public var total_pages: Int!
  
  public init(results: JSON){
    page = results["page"].int!
    total_results = results["total_results"].int!
    total_pages = results["total_pages"].int!
  }
}
