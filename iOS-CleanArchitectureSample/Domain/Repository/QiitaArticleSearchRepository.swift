//
//  QiitaArticleSearchRepository.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import Foundation

protocol QiitaArticleSearchRepository: class {
    func searchArticle(searchText: String)
}

protocol QiitaArticleSearchRepositoryInput: class {
    func searchArticle(article: [Article])
}

final class QiitaArticleSearchRepositoryImpl: QiitaArticleSearchRepository {
    fileprivate let dataStore: QiitaArticleSearchDataStore
    fileprivate weak var useCase: QiitaArticleSearchUseCaseInput?

    init(dataStore: QiitaArticleSearchDataStore) {
        self.dataStore = dataStore
    }

    func inject(useCase: QiitaArticleSearchUseCaseInput) {
        self.useCase = useCase
    }

    func searchArticle(searchText: String) {
        dataStore.searchText(text: searchText)
    }
   
}

extension QiitaArticleSearchRepositoryImpl: QiitaArticleSearchRepositoryInput {
    func searchArticle(article: [Article]) {
        useCase?.searchArticle(article: article)
    }
}
