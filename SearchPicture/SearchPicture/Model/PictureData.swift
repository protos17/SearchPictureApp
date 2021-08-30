//
//  PictureData.swift
//  SearchPicture
//
//  Created by Данил Чапаров on 29.08.2021.
//

import Foundation

struct PictureData: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let urls: Urls
}

struct Urls: Decodable {
    let regular: String
}

