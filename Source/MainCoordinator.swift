//
//  MainCoordinator.swift
//  
//
//  Created by Hitarth on 12/09/21.
//

import SwiftUI
import UIKit

public let Coordinator = MainCoordinator.shared

public class MainCoordinator {
    
    // MARK: - Variables
    private var navigationController: UINavigationController?
    
    static var shared: MainCoordinator = MainCoordinator()
    
    var navigationDelegate: NavigationProtocol {
        return self
    }
    
    public var rootView: UINavigationController? {
        return navigationController
    }
    
    private init() {}
    
    //MARK: Initializer
    public func initialize<T: View>(view: T) {
        self.navigationController = UINavigationController()
        start(content: view)
    }

    // MARK: - Methods
    private func start<T: View>(content: T) {
        let view = content
        
        let controller = UIHostingController(rootView: view)
        navigationController?.setViewControllers([controller], animated: true)
        navigationController!.navigationBar.isHidden = true
    }
 
}

extension MainCoordinator: NavigationProtocol {
    public func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    public func moveToView<T: View>(content: T) {
        DispatchQueue.main.async {
            let view = content
            let controller = UIHostingController(rootView: view)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    public func present<T>(content: T, style: UIModalPresentationStyle = .popover) where T : View {
        DispatchQueue.main.async {
            let view = content
            let controller = UIHostingController(rootView: view)
            controller.modalPresentationStyle = style
            self.navigationController?.present(controller, animated: true, completion: nil)
        }
    }
    
    public func dismissView() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
}
