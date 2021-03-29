//
//  PexelsClient.swift
//  SearchForFreePhotos
//
//  Created by Lucky on 29.03.2021.
//

import Foundation

final class PexelsClient: APIClient {
    var session: URLSession
    
    init(config: URLSessionConfiguration) {
        self.session = URLSession(configuration: config)
    }
    
    convenience init() {
        self.init(config: .default)
    }
    
    func getPhotos(from photoFeedType: PhotoFeed, completion: @escaping (Result<PhotoFeedResult?, APIError>) -> Void) {
        fetch(with: photoFeedType.request, decode: {json -> PhotoFeedResult? in
            guard let photoFeedResult = json as? PhotoFeedResult else { return nil }
            return photoFeedResult
        }, completion: completion)
    }
 }
