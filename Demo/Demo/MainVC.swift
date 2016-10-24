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

struct movies{
    var id: Int?
    var genreName: String?
    var movie: [MovieMDB]?
    init(id_: Int?, genreName_: String?, movies_: [MovieMDB]?){
        id = id_
        genreName = genreName_
        movie = movies_
    }
}

class MainVC: UIViewController {

    var dataSource = [movies]()
    var dlIndex = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GenresMDB.genres(apikey, listType: "movie", language: "en"){
            api in
            for i in 0..<api.data!.count{
                self.dataSource.append(movies.init(id_: api.data![i].id, genreName_: api.data![i].name, movies_: nil))
            }
            self.getMovies()
        }
    }
    
    
    
    func getMovies(){
        if(dlIndex < dataSource.count){
            GenresMDB.genre_movies(apikey, genreId: dataSource[dlIndex].id!, include_all_movies: true, include_adult_movies: true, language: "en"){
                api in
                print(api.data![self.dlIndex])
                self.dataSource[self.dlIndex].movie = api.data!
                self.dlIndex += 1
                self.getMovies()
            }
            
        }else{
            handleTableViewData{
                _ in
            }
        }
    }
    
    
    func handleTableViewData(completionHandler: (Bool) -> ()) -> (){
        print(dataSource[5].movie![0].original_title)
        completionHandler(true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

