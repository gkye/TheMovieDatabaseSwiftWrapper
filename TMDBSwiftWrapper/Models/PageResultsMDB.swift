//
//  PageResultsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-14.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class PageResultsMDB{
    
    var page: Int!
    var total_results: Int!
    var total_pages: Int!
    
    init(results: JSON){
        page = results["page"].int!
        total_results = results["total_results"].int!
        total_pages = results["total_pages"].int!
    }
}