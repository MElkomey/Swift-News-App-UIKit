//
//  ViewController.swift
//  Arab News
//
//  Created by Mohamed Elkomey on 06/07/2023.
//

import UIKit

class PostsViewController: UIViewController {
    
    var articles = [Article]()
    //var articles = [Article(title: "", url: "")]
    
    var newsAPI = NewsAPI()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        newsAPI.fetchData()
        newsAPI.delegate = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! DetailsViewController
        let selectedRow = tableView.indexPathForSelectedRow?.row
        detailsVC.link = articles[selectedRow!].url
    }

}

extension PostsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = articles[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension PostsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        performSegue(withIdentifier: "goToDetailsSegue", sender: self)
    }
}

extension PostsViewController:NewsAPIDelegate{
    func didFetchPosts(posts: Posts) {
        articles = posts.articles
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func didFailWithError(error: Error?) {
        print("Error fetching data")
    }

}
