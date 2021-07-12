//
//  Webview+Extensions.swift
//  HackerNews
//
//  Created by Zaheer Moola on 2021/07/12.
//

import WebKit

extension WKWebView {
    static func pageNotFoundView() -> WKWebView {
        let wk = WKWebView()
        wk.loadHTMLString("<html><body><h1>Page not found!</h1></body></html>", baseURL: nil)
        return wk
    }
}
