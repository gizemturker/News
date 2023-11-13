//
//  SafariWebView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
}
