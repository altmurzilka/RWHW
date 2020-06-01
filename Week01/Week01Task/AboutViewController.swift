//
//  AboutViewController.swift
//  Week01Task
//
//  Created by алтынпончик on 6/2/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlPath = Bundle.main.path(forResource: "Data", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
