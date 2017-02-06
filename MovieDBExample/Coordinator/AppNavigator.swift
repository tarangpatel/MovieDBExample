//
//  AppNavigator.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/3/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation
import UIKit

enum NavigationType {
    
    case push
    case pop
    case modal
    case show
}

protocol AppNavigatorProtocol {
    
    associatedtype ViewModelType
    
    func navigateTo(destination: ViewControllerProtocol, navigationType: NavigationType, viewModel: ViewModelType)
}

class AppNavigator: AppNavigatorProtocol {
    
    static let navigator = AppNavigator(window: ((UIApplication.shared.delegate?.window)!)!)
    let storyboard: UIStoryboard
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.navigationController = window.rootViewController as! UINavigationController
    }
    
    func navigateTo(destination: ViewControllerProtocol, navigationType: NavigationType, viewModel: ViewModelProtocol) {
        
        var vc = self.storyboard.instantiateViewController(withIdentifier: destination.className) as! ViewControllerProtocol
        vc.viewModel = viewModel
        
        print(destination.className)
        
        switch navigationType {
        case .push:
            self.navigationController.pushViewController(vc as! UIViewController, animated: true)
            break
        default:
            break
        }
    }
    
}
