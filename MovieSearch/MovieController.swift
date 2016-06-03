//
//  MovieController.swift
//  MovieSearch
//
//  Created by Eva Marie Bresciano on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    init() {
        fetchMovies { (Movie) in
            self.movie = Movie }
    }
    static let sharedController = MovieController()
    
   let url = NSURL(string:"http://api.themoviedb.org/3/search/movie?api_key=f83783c7c1e09d03fe09770bc9c4bf57&query=Movie")
    
    var movie: [Movie] = []
    
    func fetchMovies(completion: (movies: [Movie]) -> Void) {
      guard let url = url else { return
        }
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data,
            jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)),
                resultsArray = jsonDictionary["results"] as? [[String:AnyObject]] else {
                    completion (movies: [])
                    return
            }
            
            let moviesArray = resultsArray.flatMap({Movie(dictionary: $0)})
            completion(movies: moviesArray)
    }
    
 }

}