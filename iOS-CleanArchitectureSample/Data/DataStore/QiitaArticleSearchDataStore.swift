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
        let urlString = "https://qiita.com//api/v2/users/\(text)/items?page=1&per_page=10"

        guard let url = URLComponents(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url.url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            
            let article = try! JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                self.repository?.searchArticle(article: article)
            }
        }
        task.resume()
        
        
        
    }
}
