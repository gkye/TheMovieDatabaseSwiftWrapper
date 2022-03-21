//
//  VideoMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct VideosMDB: Codable{
  public var id: String!
  public var iso_639_1: String?
  public var key: String!
  public var name: String!
  public var site: String?
  public var size: Int!
  public var  type: String!
}
