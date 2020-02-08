//
//  WireFrame.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit

protocol WireFrame {
    associatedtype ViewController: UIViewController

    init(viewController: ViewController)
}
