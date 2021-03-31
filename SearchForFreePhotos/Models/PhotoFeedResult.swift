//
//  PhotoFeedResult.swift
//  SearchForFreePhotos
//
//  Created by Lucky on 26.03.2021.
//

import Foundation

struct PhotoFeedResult: Codable {
    var total_results: Int
    var page: Int
    var per_page: Int
    var photos: [Photo]
}
