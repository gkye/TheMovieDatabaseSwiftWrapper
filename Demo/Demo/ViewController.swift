//
//  ViewController.swift
//  Demo
//
//  Created by George on 2016-04-07.
//  Copyright © 2016 George. All rights reserved.
//

import UIKit
import TMDBSwift


let apikey = "8a7a49369d1af6a70ec5a6787bbfcf79"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MovieMDB.toprated(apikey, language: "en"){
            topRatedMovies in
            let movie = topRatedMovies.movie!
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
       
        MovieMDB.upcoming(apikey, language: "en"){
            upcomingMovies in
            let movie = upcomingMovies.movie!
            print(movie[0].title)
            print(movie[0].original_title)
            print(movie[0].release_date)
            print(movie[0].overview)
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

