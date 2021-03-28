//
//  EndPoint.swift
//  SearchForFreePhotos
//
//  Created by Lucky on 26.03.2021.
//

import Foundation

protocol EndPoint {
    var base: String { get }
    var path: String { get }
    var query: String { get }
}

extension EndPoint {
    var authHeader: String {
        return API.key
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base) ?? URLComponents()
        components.path = path
        components.query = query
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url ?? URL(string: "https://www.google.com")!
        var request = URLRequest(url: url)
        request.setValue(authHeader, forHTTPHeaderField: "Authorization")
        return request
    }
}
