//
//  GenericResponse.swift
//  Ecommerce
//
//  Created by Admin on 5/25/21.
//  Copyright © 2021 Travelogy. All rights reserved.
//

import Foundation

protocol Response: Codable, Hashable, Error {
    var message: String? { get set }
    var data: [String: [String]]? { get set }
    var status: Bool? { get set }
    var localizedDescription: String? { get set }
}

struct GenericResponse: Response{
    var message: String?
    var data: [String: [String]]?
    var status: Bool?
    var localizedDescription: String?
}
extension GenericResponse {
    init(_ description: String? = TextMessages.somethingWentWrong) {
        localizedDescription = description
        status = false
    }
}

import Foundation
struct TextMessages {
    static var somethingWentWrong = "Please try in sometime, something went wrong."
}
