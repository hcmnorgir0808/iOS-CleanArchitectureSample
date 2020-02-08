//
//  QiitaArticleSearchViewControllerBuilder.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit
import Foundation

struct QiitaArticleSearchViewControllerBuilder: ViewControllerBuilder {
    typealias ViewController = QiitaArticleSearchViewController
    
    static func build() -> ViewController {
        let viewController = UIStoryboard(name: "QiitaArticleSearchViewController", bundle: nil).instantiateInitialViewController() as! QiitaArticleSearchViewController
        let wireframe      = QiitaArticleSearchWireFrame(viewController: viewController)
        let dataStore      = QiitaArticleSearchDataStoreImpl()
        let repository     = QiitaArticleSearchRepositoryImpl(dataStore: dataStore)
        let useCase        = QiitaArticleSearchUseCaseImpl(repository: repository)
        let presenter      = QiitaArticleSearchPresenterImpl(useCase: useCase, wireframe: wireframe)

        // 依存性の注入はView方向に近い一番近いレイヤー
        dataStore.inject(repository: repository)
        repository.inject(useCase: useCase)
        useCase.inject(presenter: presenter)
        presenter.inject(viewController: viewController)
        viewController.inject(presenter: presenter)
        return viewController
    }
}
