//
//  ContentType.swift
//  Ecommerce
//
//  Created by Admin on 5/25/21.
//  Copyright © 2021 Travelogy. All rights reserved.
//

import Foundation
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case userAgent = "x-user-agent"
}
enum ContentType: String {
    case form = "application/x-www-form-urlencoded"
    case json = "application/json"
    case text = "text/html"
    case agent = "ios"
}
