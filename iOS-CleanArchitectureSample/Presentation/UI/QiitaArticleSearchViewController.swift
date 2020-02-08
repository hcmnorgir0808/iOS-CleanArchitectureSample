//
//  QiitaArticleSearchViewController.swift
//  iOS-CleanArchitectureSample
//
//  Created by yaiwamoto on 01/02/2020.
//  Copyright © 2020 Yasutaka Iwamoto. All rights reserved.
//

import UIKit

// APIかなんかでデータをとってきた後にViewに描画をする際のプロトコル
protocol QiitaArticleSearchViewInput: class {
    func setTableView()
}

final class QiitaArticleSearchViewController: UIViewController {

    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var presenter: QiitaArticleSearchPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Presenterの初期化
    func inject(presenter: QiitaArticleSearchPresenter) {
        self.presenter = presenter
    }

    // searchBarに文字が入力された後、ボタンを押す
    @IBAction func didTappedSearchButton(_ sender: Any) {
        presenter?.didTapSearchButton(searchText: searchBarTextField.text)
    }
}

// Viewを描画する際のprotocolを実装
extension QiitaArticleSearchViewController: QiitaArticleSearchViewInput {
    func setTableView() {
        tableView.reloadData()
        searchBarTextField.text = "aaa"
    }
}

