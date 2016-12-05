public struct SearchMDB{
  
  ///Search for companies by name.
  public static func company(_ api_key: String!, query: String, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ company: [parent_companymdb]? ) -> ()) -> (){
    
    Client.Search("company", api_key: api_key, query: query, page: page, language: nil, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil){
      apiReturn in
      
      var company = [parent_companymdb]()
      if apiReturn.error == nil{
        if(apiReturn.json!["results"].count > 0){
          company = parent_companymdb.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, company)
    }
  }
  
  
  ///Search for collections by name. Overview and collectionItems will return nil
  public static func collection(_ api_key: String!, query: String, page: Int?, language: String?, completion: @escaping (_ clientReturn: ClientReturn, _ collection: [CollectionMDB]? ) -> ()) -> (){
    
    Client.Search("collection", api_key: api_key, query: query, page: page, language: language, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil){
      apiReturn in
      
      var collection = [CollectionMDB]()
      if apiReturn.error == nil{
        if(apiReturn.json!["results"].count > 0){
          collection = CollectionMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, collection)
    }
  }
  
  ///Search for keywords by name.
  public static func keyword(_ api_key: String!, query: String, page: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ keyword: [KeywordsMDB]? ) -> ()) -> (){
    
    Client.Search("keyword", api_key: api_key, query: query, page: page, language: nil, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil){
      apiReturn in
      
      var keyword = [KeywordsMDB]()
      if apiReturn.error == nil{
        if(apiReturn.json!["results"].count > 0){
          keyword = KeywordsMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, keyword)
    }
  }
  
  ///Search for lists by name and description.
  public static func list(_ api_key: String!, query: String, page: Int?, include_adult: Bool?, completion: @escaping (_ clientReturn: ClientReturn, _ list: [ListsMDB]? ) -> ()) -> (){
    
    Client.Search("list", api_key: api_key, query: query, page: page, language: nil, include_adult: include_adult, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil){
      apiReturn in
      
      var list: [ListsMDB]?
      if apiReturn.error == nil{
        if(apiReturn.json!["results"].count > 0){
          list = ListsMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, list)
    }
  }
  
  
  ///Search for movies by title.
  public static func movie(_ api_key: String!, query: String, language: String?, page: Int?, includeAdult: Bool?, year: Int?, primaryReleaseYear: Int?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB]?) -> ()) -> (){
    
    Client.Search("movie", api_key: api_key, query: query, page: page, language: language, include_adult: includeAdult, year: year, primary_release_year: primaryReleaseYear, search_type: nil, first_air_date_year: nil) { apiReturn in
      var movie: [MovieMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          movie = MovieMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, movie)
    }
  }
  
  ///Search for people by name.
  public static func person(_ api_key: String!, query: String, page: Int?, includeAdult: Bool?, completion: @escaping (_ clientReturn: ClientReturn, _ person: [PersonResults]?) -> ()) -> (){
    
    Client.Search("person", api_key: api_key, query: query, page: page, language: nil, include_adult: includeAdult, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil) { apiReturn in
      var person: [PersonResults]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          person = PersonResults.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, person)
    }
  }
  
  ///Search for TV shows by title.
  public static func tv(_ api_key: String!, query: String, page: Int?, language: String?, first_air_date_year: String?, completion: @escaping (_ clientReturn: ClientReturn, _ tvShows: [TVMDB]?) -> ()) -> (){
    
    Client.Search("tv", api_key: api_key, query: query, page: page, language: language, include_adult: nil, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: first_air_date_year) { apiReturn in
      var person: [TVMDB]?
      if(apiReturn.error == nil){
        if(apiReturn.json!["results"].count > 0){
          person = TVMDB.initialize(json: apiReturn.json!["results"])
        }
      }
      completion(apiReturn, person)
    }
  }
  
  ///Search multiple models in a single request. Multi search currently supports searching for movies, tv shows and people in a single request.
  public static func multiSearch(_ api_key: String!, query: String, page: Int?, includeAdult: Bool?, language: String?, region: String?, completion: @escaping (_ clientReturn: ClientReturn, _ movie: [MovieMDB],_ tv: [TVMDB], _ person: [PersonResults]) -> ()) -> (){
    
    Client.Search("multi", api_key: api_key, query: query, page: page, language: language, include_adult: includeAdult, year: nil, primary_release_year: nil, search_type: nil, first_air_date_year: nil){ apiReturn in
      var person = [PersonResults]()
      var tv = [TVMDB]()
      var movie = [MovieMDB]()
      
      apiReturn.json?["results"].forEach({
        switch $0.1["media_type"].string!{
        case "tv":
          tv.append(TVMDB(results: $0.1))
        case "movie":
          movie.append(MovieMDB(results: $0.1))
        case "person":
          person.append(PersonResults(results: $0.1))
        default:
          break
        }
      })
      
      completion(apiReturn, movie, tv, person)
      
    }
  }
  
}
