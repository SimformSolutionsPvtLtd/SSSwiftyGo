//
//  DiscoveryAPIRouter.swift
//  Ecommerce
//
//  Created by Admin on 5/25/21.
//  Copyright © 2021 Travelogy. All rights reserved.
//

import Alamofire
import Foundation
enum DiscoveryAPIRouter: APIConfiguration {
    
    case newsApi
    
    var method: HTTPMethod {
        switch self {
            case .newsApi:
                return .get
        }
    }
    
    var path: String {
        switch self {
            case .newsApi:
                return api
        }
    }
    
    var parameters: Parameters? {
        switch self {
            case .newsApi:
                return nil
        }
    }
}


struct RequestParameterKeys {
    static let id = "id"
}
