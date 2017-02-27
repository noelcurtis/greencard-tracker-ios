//
//  VisaBulletinClient.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/3/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import Foundation

enum ClientError: Error {
    
    case Unknown
    case FailedRequest
    case InvalidResponse
    
}

typealias VisaBulletinClientCompletion = (AnyObject?, ClientError?) -> ()

protocol VisaBulletinClient {
    func getLatestBulletin(completion: @escaping VisaBulletinClientCompletion)
}

final class S3VisaBulletinClient: VisaBulletinClient {
    let baseURL: URL
    
    // MARK: - Initialization
    
    init() {
        self.baseURL = URL(string: "https://s3.amazonaws.com/")!
    }
    
    // MARK: - Protocol
    
    func getLatestBulletin(completion: @escaping VisaBulletinClientCompletion) {
        let bulletinUrl = baseURL.appendingPathComponent("greencard-dev/bulletin.json")
        URLSession.shared.dataTask(with: bulletinUrl) { (data, response, error) in
            self.didFetchBulletinData(data: data, response: response, error: error, completion: completion)
        }.resume()
    }
    
    
    // MARK: - Helper Methods
    
    private func didFetchBulletinData(data: Data?, response: URLResponse?, error: Error?, completion: VisaBulletinClientCompletion) {
        if let _ = error {
            completion(nil, .FailedRequest)
            
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                processBulletin(data: data, completion: completion)
            } else {
                completion(nil, .FailedRequest)
            }
            
        } else {
            completion(nil, .Unknown)
        }
    }
    
    private func processBulletin(data: Data, completion: VisaBulletinClientCompletion) {
        if let bulletin = Bulletin.from(jsonData: data) {
            completion(bulletin, nil)
        } else {
            completion(nil, .InvalidResponse)
        }
    }

}
