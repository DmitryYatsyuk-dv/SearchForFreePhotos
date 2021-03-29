//
//  Result.swift
//  SearchForFreePhotos
//
//  Created by Lucky on 29.03.2021.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
