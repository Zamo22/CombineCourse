//
//  Webview.swift
//  HackerNews
//
//  Created by Zaheer Moola on 2021/07/12.
//

import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    var url: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else {
            return WKWebView.pageNotFoundView()
        }

        let request = URLRequest(url: url)
        let webPage = WKWebView()
        webPage.load(request)
        return webPage
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<Webview>) {
        guard let url = URL(string: url) else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }

}
