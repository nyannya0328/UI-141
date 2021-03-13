//
//  AllViewModel.swift
//  UI-141
//
//  Created by にゃんにゃん丸 on 2021/03/11.
//

import SwiftUI
import AVKit

class AllViewModel: ObservableObject {
    @Published var shoplayer = false
    @Published var offset : CGSize = .zero
    @Published var scale : CGFloat = 1
    @Published var selectedvideo : Video = Video(player: AVPlayer())
    
    
    @Published var urls = [
    
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.google.com/")!),
        Page(url: URL(string: "https://www.google.com/")!),
        Page(url: URL(string: "https://www.google.com/")!),
        Page(url: URL(string: "https://www.google.com/")!),
        Page(url: URL(string: "https://www.google.com/")!),
        Page(url: URL(string: "https://www.google.com/")!),
        Page(url: URL(string: "https://www.google.com/")!),
        Page(url: URL(string: "https://www.google.com/")!),
    ]
    
    @Published var selectedtab = "card"
    
    @Published var currentpage : Page?
}
