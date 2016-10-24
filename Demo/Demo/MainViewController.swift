//
//  MainViewController.swift
//  Demo
//
//  Created by George on 2016-04-11.
//  Copyright © 2016 George. All rights reserved.
//

import UIKit
import TMDBSwift
import AlamofireImage
import ScrollPager

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, ScrollPagerDelegate{
    
    var dataSource = [MovieMDB]()
    var pageResult: PageResultsMDB!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pager: ScrollPager!
    var moviesPager = ["Popular", "Top Rated", "Now Playing"]
    var page = 1
    var scrollIndex = 0
    override func viewDidLoad() {
        pager.delegate = self
        APIFuncs.loadMovieData(0){
            api in
            self.pageResult = api.0.pageResults
            if(api.1 != nil){
                self.dataSource = api.1!
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.collectionView?.reloadData()
                })
            }
        }
        pager.addSegmentsWithTitles(moviesPager)
        
    }
    
    
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int) {
        page = 1
        dataSource.removeAll()
        scrollIndex = changedIndex
        APIFuncs.loadMovieData(changedIndex, page: page){
            api in
            if(api.1 != nil){
                self.dataSource = api.1!
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.collectionView?.reloadData()
                    self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), atScrollPosition: .Top, animated: true)
                })
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MainCollectionViewCell
        let source = dataSource[indexPath.row].poster_path
        if(source != nil){
            let url = "http://image.tmdb.org/t/p/w300"+source!
            cell.image.af_setImageWithURL(NSURL(string: url)!)
        }else{
            cell.image.image = UIImage(named: "placeholder")
        }
     
            
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width / 2 - 2, height: 250)
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == dataSource.count - 2{
            if(page < pageResult.total_pages){
                print("loading more")
                page += 1
                print(moviesPager[scrollIndex])
                print(pageResult.page, "current page")
                APIFuncs.loadMovieData(scrollIndex, page: page){
                    api in
                    self.pageResult = api.0.pageResults
                    if(api.1 != nil){
                        for i in api.1!{
                           self.dataSource.append(i)
                        }
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.collectionView?.reloadData()
                        })
                    }
                }
            }
        }
    }
    
}
class APIFuncs{
    
    //this corrsponds to the selected index of the page scroller
    class  func loadMovieData(index: Int, page: Int = 1, completionHandler: (ClientReturn, [MovieMDB]?) -> ()) -> (){
        switch index {
        case 0:
            MovieMDB.popular(apikey, language: "en", page: page){
                api in
                completionHandler(api.clientReturn, api.movie)
            }
        case 1:
            MovieMDB.toprated(apikey, language: "en", page: page){
                api in
                completionHandler(api.clientReturn, api.movie)
            }
        case 2:
            MovieMDB.nowplaying(apikey, language: "en", page: page){
                api in
                completionHandler(api.clientReturn, api.movie)
            }
        default: break
        }
        
    }
}
