//
//  NewsListTableViewController.swift
//  GoodNewsApp
//
//  Created by 재영신 on 2021/12/07.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-11-07&sortBy=publishedAt&apiKey=a0c7b0d66fe14b4bbeee71283bfd20ca")!
        
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numverOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.decription
        
        return cell
    }
}


