//
//  Test.swift
//  Demo
//
//  Created by George on 2016-04-27.
//  Copyright © 2016 George. All rights reserved.
//

import Foundation
import TMDBSwift
import UIKit

class All: UIViewController {
  
  
  var videos: [VideosMDB]?
  var images: ImagesMDB?
  
  override func viewDidLoad() {
    
    
    TVMDB.tvAppendTo(apikey, tvShowID: 1396, append_to: ["images", "videos"]){
      data in
      self.videos = VideosMDB.initialize(json: data.json!["videos"]["results"])
      self.images = ImagesMDB.init(results: data.json!["images"])
      print(self.videos?.count); print(self.images?.backdrops.count)
      print(self.videos)

    }
    
  }
  
}