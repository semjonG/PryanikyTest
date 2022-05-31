//
//  PryanikyResponse.swift
//  PryanikyTest
//
//  Created by mac on 29.05.2022.
//

import Foundation

// MARK: - PryanikyResponse
struct PryanikyResponse: Codable {
    let data: [DataResult]
    let view: [String]
}

// MARK: - DataResults
struct DataResult: Codable {
    let name: String
    let data: DataObject
}

// MARK: - DataObject
struct DataObject: Codable {
    let text: String?  // PictureModel
    let url: String? //   PictureModel
    let selectedID: Int?  //     SelectorModel
    let variants: [Variant]?  // SelectorModel

    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

// MARK: - Variant  // SelectorVariantsModel
struct Variant: Codable {
    let id: Int
    let text: String
}
