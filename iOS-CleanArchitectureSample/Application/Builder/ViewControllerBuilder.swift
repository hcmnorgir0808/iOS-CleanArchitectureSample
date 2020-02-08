//
//  ViewControllerBuilder.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit

protocol ViewControllerBuilder {
    associatedtype ViewController: UIViewController

    static func build() -> ViewController
}
