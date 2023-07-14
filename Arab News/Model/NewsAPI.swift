

import Foundation

protocol NewsAPIDelegate{
    func didFetchPosts(posts:Posts)
    func didFailWithError(error:Error?)
}

class NewsAPI{
    var delegate:NewsAPIDelegate?
    
    func fetchData(){
        let urlString = "https://newsapi.org/v2/top-headlines?sources=google-news-sa&apiKey=d6d15b5dd8344879a852ead84b5d6230"
        let url = URL(string: urlString)
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription )
            }else{
                //print(String(data: data!, encoding: .utf8))
                do{
                    let posts = try JSONDecoder().decode(Posts.self, from: data!)
                    print(posts.articles[0].title)
                    print(posts.articles[0].url)
                    self.delegate?.didFetchPosts(posts: posts)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        }
        
        
    }

