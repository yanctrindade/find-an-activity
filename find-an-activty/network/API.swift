//
//  API.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 25/11/21.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

public class APIClient {

    // MARK: - Properties

    private let baseURL = URL(string: "http://www.boredapi.com/api/activity/")!

    private let session: URLSession

    // MARK: - Life Cycle

    public init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    // MARK: - Methods
    public func getActivity(with activityParameter: ActivityParameter?, completion: @escaping (_ result: Result<ActivityResponse>) -> Void) {
        
        let queryString = ""

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
                    
                    //let images = paths.map({PlaceItem(url: $0)})

                    DispatchQueue.main.async {
                        completion(.success(activity))
                    }

                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
    }

}
