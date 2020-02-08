//
//  QiitaArticleSearchDataStore.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import Foundation

protocol QiitaArticleSearchDataStore: class {
    func searchText(text: String)
}

final class QiitaArticleSearchDataStoreImpl: QiitaArticleSearchDataStore {
    
    fileprivate weak var repository: QiitaArticleSearchRepositoryInput?

    func inject(repository: QiitaArticleSearchRepositoryInput) {
        self.repository = repository
    }
    
    func searchText(text: String) {
        repository?.searchArticle(text: "aaa")
    }
}

// MARK: - GitHubRepositoryRepositoryInput
