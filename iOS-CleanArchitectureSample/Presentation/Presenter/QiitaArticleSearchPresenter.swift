//
//  QiitaArticleSearchPresenter.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import Foundation

// Viewのイベントを扱うprotocol
protocol QiitaArticleSearchPresenter: class {
    func didTapSearchButton(searchText: String?)
}

protocol QiitaArticleSearchPresenterInput: class {
    func searchArticle(_ repositoriesModel: String)
}

final class QiitaArticleSearchPresenterImpl: QiitaArticleSearchPresenter {
    
    fileprivate let useCase: QiitaArticleSearchUseCase
    fileprivate let wireframe: QiitaArticleSearchWireFrame
    fileprivate weak var viewController: QiitaArticleSearchViewInput?
    
    // builderが呼ばれ、useCaseが注入される
    init(useCase: QiitaArticleSearchUseCase, wireframe: QiitaArticleSearchWireFrame) {
        self.useCase = useCase
        self.wireframe = wireframe
    }
    
    // PresenterにViewを描画するメソッドが詰められているprotocolが決められる
    func inject(viewController: QiitaArticleSearchViewInput) {
        self.viewController = viewController
    }

    func didTapSearchButton(searchText: String?) {
        useCase.searchArticle(searchText: searchText)
    }
}

extension QiitaArticleSearchPresenterImpl: QiitaArticleSearchPresenterInput {
    func searchArticle(_ repositoriesModel: String) {
        viewController?.setTableView()
    }
}
