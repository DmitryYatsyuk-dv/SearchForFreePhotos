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
}
