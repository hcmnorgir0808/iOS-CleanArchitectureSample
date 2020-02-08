//
//  QiitaArticleSearchUseCase.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import Foundation

protocol QiitaArticleSearchUseCase: class {
    func searchArticle(searchText: String?)
}

protocol QiitaArticleSearchUseCaseInput: class {
    func searchArticle(text: String?)
}
// useCaseとrepositoryの橋渡し的なprotocol, 中身の実装はrepositoryにやってもらう

final class QiitaArticleSearchUseCaseImpl: QiitaArticleSearchUseCase {
    
    fileprivate let repository: QiitaArticleSearchRepository
    fileprivate weak var presenter: QiitaArticleSearchPresenterInput?
    
    init(repository: QiitaArticleSearchRepository) {
        self.repository = repository
    }
    
    func inject(presenter: QiitaArticleSearchPresenterInput) {
        self.presenter = presenter
    }
    
    func searchArticle(searchText: String?) {
        if let text = searchText, !text.isEmpty {
            repository.searchArticle(searchText: text)
        } else {
            presenter?.searchArticle("aaa")
        }
    }
}

extension QiitaArticleSearchUseCaseImpl: QiitaArticleSearchUseCaseInput {
    func searchArticle(text: String?) {
        if let text = text {
            presenter?.searchArticle(text)
        }
    }
}
