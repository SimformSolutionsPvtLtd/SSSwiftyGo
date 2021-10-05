//
//  Threading.swift
//  TFOur Plus
//
//  Created by Hitarth on 09/09/21.
//

import Foundation


struct Thread {
    
    static func runInMainThread(_ block: @escaping ()->()) {
        DispatchQueue.main.async(execute: block)
    }
    
}
