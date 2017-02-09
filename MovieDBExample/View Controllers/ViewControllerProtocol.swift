//
//  ViewControllerProtocol.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/6/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol {
    
    var viewModel: ViewModelProtocol! { get set }
}

extension ViewControllerProtocol {
    var className: String {
        let tempSelf = self as! UIViewController
        return NSStringFromClass(tempSelf.classForCoder).components(separatedBy: ".").last!
    }
}
