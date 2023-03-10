//
//  APICaller.swift
//  project2
//
//  Created by Dimash Nsanbaev on 11/25/22.
//

import Foundation

struct Constants{
    static let API_KEY = "2d5b5ff440d52e3087eb07c5dd93ac3e"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError:Error{
    case failedToGetData
    
}

class APICaller{
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion:@escaping (Result<[Title],Error>) ->Void) {
        
        guard let url = URL(string:"\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data,error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from:data)
                completion(.success(results.results))
//                for i in results.results {
//                    print("\(i.original_title!) &&& \(i.id) ")
//                }
            }catch{
                completion(.failure(APIError.failedToGetData))
 
            }
         
        }
        task.resume()
        
    }
        func getTrendingTvs(completion:@escaping (Result<[Title ],Error>) ->Void) {
            guard let url = URL(string:"\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data,error == nil else{
                    return
                }
    
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from:data)
                    completion(.success(results.results))
                }catch{
                    completion(.failure(APIError.failedToGetData))
    
                }
            }
            task.resume()
            }
    
        func getUpcomingMovies(completion:@escaping (Result<[Title],Error>) ->Void) {
            guard let url = URL(string:"\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data,error == nil else{
                    return
                }
    
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from:data)
                    completion(.success(results.results))
                }catch{
                    print(error.localizedDescription)
                }
            }
            task.resume()
            }
        func getPopularMovies(completion:@escaping (Result<[Title],Error>) ->Void) {
            guard let url = URL(string:"\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data,error == nil else{
                    return
                }
    
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from:data)
                    completion(.success(results.results))
                }catch{
                    completion(.failure(APIError.failedToGetData))
    
                }
            }
            task.resume()
            }
        func getTopRated(completion:@escaping (Result<[Title],Error>) ->Void) {
            guard let url = URL(string:"\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data,error == nil else{
                    return
                }
    
                do{
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from:data)
                    completion(.success(results.results))
                }catch{
                    completion(.failure(APIError.failedToGetData))
    
                }
            }
            task.resume()
            }
    func getMovie(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
            

        guard let url = URL(string:"\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    
                    completion(.success(results.results))
                    

                } catch {
                    completion(.failure(error))
                    
                    print(error.localizedDescription)
                }

            }
            task.resume()
        }
        
    }


