//
//  WebViewController.swift
//  withOutStoryboard
//
//  Created by Valia Smolin on 26.05.2024.
//


import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://inflowy.ru")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
