//
//  API.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(ErrorEnum)
}

public enum ErrorEnum  {
    case notFound(msg: String)
    case genericError(_ error: Error)
}

public class APIClient {

    // MARK: - Properties

    private let baseURL = URL(string: "http://www.boredapi.com/api/")!
    
    private let imageBaseURL = URL(string: "https://api.thecatapi.com/v1/images/search")!

    private let session: URLSession

    // MARK: - Life Cycle

    public init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    // MARK: - Methods
    public func getActivity(with activityParameter: ActivityParameter, completion: @escaping (_ result: Result<ActivityResponse>) -> Void) {
        
        var queryString = "activity/"
        
        if let participants = activityParameter.numberOfParticipants {
            queryString = queryString + "?participants=\(participants)"
        }
        if let type = activityParameter.activityType {
            if queryString == "activity/"{
                queryString = queryString + "?type=\(type.rawValue)"
            } else {
                queryString = queryString + "&type=\(type.rawValue)"
            }
        }
        if let priceRange = activityParameter.priceRange {
            if queryString == "activity/" {
                queryString = queryString + "?minprice=\(priceRange.minPrice)&maxprice=\(priceRange.maxPrice)"
            } else {
                queryString = queryString + "&minprice=\(priceRange.minPrice)&maxprice=\(priceRange.maxPrice)"
            }
        }

        guard let requestURL = URL(string: queryString, relativeTo: baseURL) else {
            return
        }

        let request = URLRequest(url: requestURL)

        let task = session.dataTask(with: request) { data, response, error in

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    let activity = try decoder.decode(ActivityResponse.self, from: data)
                    
                    if let error = activity.error {
                        DispatchQueue.main.async {
                            completion(.failure(ErrorEnum.notFound(msg: error)))
                        }
                        return
                    }

                    DispatchQueue.main.async {
                        completion(.success(activity))
                    }

                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(ErrorEnum.genericError(error)))
                    }
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(ErrorEnum.genericError(error)))
                }
            }
        }

        task.resume()
    }

    public func getImage(_ completion: @escaping (_ result: Result<[ImageResponse]>) -> Void) {
        
        let request = URLRequest(url: imageBaseURL)

        let task = session.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    let images = try decoder.decode([ImageResponse].self, from: data)

                    DispatchQueue.main.async {
                        completion(.success(images))
                    }

                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(ErrorEnum.genericError(error)))
                    }
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(ErrorEnum.genericError(error)))
                }
            }
        }

        task.resume()
    }
}
