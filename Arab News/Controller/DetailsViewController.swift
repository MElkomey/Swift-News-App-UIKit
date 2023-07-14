//
//  DetailsViewController.swift
//  Arab News
//
//  Created by Mohamed Elkomey on 07/07/2023.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    var link:String?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if NSURL(string: link!) != nil{
        webView.load(NSURLRequest(url: NSURL(string: link!)! as URL) as URLRequest)
        }else{
            print("URL not found")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
