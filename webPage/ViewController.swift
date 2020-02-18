//
//  ViewController.swift
//  webPage
//
//  Created by Y. Yang on 9/29/18.
//  Copyright © 2018 Y. Yang. All rights reserved.
//

import UIKit
import WebKit

/*
 https://twitter.com
 https://facebook.com
 https://linkedin.com
 https://instagram.com
 */

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    @IBOutlet var myWebView: WKWebView! = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        myWebView.allowsBackForwardNavigationGestures = true
        myWebView.uiDelegate = self
        
        let myURL = URL(string: "https://twitter.com")
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }

    
    // this handles target=_blank links by opening them in the same view
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
 
    
}

