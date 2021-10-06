//
//  NavigationProtocol.swift
//  Demo
//
//  Created by Hitarth on 29/09/21.
//

import SwiftUI

protocol NavigationProtocol {
    func moveToView<T: View>(content: T)
    func popToPrevious()
    func present<T: View>(content: T)
    func dismissView()
}
