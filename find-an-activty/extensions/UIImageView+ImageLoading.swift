//
//  UIImageView+ImageLoading.swift
//  find-an-activty
//
//  Created by Yan Correa Trindade on 26/11/21.
//

import UIKit

extension UIImageView {

    /// Sets the ImageViews image as the contents of the URL
    ///
    /// - Parameter url: The location of the image.
    /// - Parameters:
    ///   - url: The location of the image.
    ///   - urlSession: The URLSession to run the task on.
    /// - Returns: the URLSessionTask of the operation.
    @discardableResult
    func setImage(from url: URL, usingUrlSession urlSession: URLSession = URLSession.shared) -> URLSessionTask {

        let imageRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        let imageRequestTask = urlSession.dataTask(with: imageRequest) { (data, response, error) in
            if error != nil {
                dump(error)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Not a proper HTTPURLResponse or statusCode")
                return
            }

            DispatchQueue.main.sync { [weak self] in
                self?.image = UIImage(data: data!)
            }
        }

        imageRequestTask.resume()

        return imageRequestTask
    }

}
