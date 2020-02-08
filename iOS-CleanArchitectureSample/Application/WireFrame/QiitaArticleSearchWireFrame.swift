//
//  QiitaArticleSearchWireFrame.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import Foundation

struct QiitaArticleSearchWireFrame: WireFrame {
    typealias ViewController = QiitaArticleSearchViewController

    fileprivate weak var viewController: QiitaArticleSearchViewController?

    init(viewController: ViewController) {
        self.viewController = viewController
    }
}
