//
//  Video.swift
//  UI-141
//
//  Created by にゃんにゃん丸 on 2021/03/11.
//

import SwiftUI
import AVKit

struct Video: Identifiable {
    var id = UUID().uuidString
    var player : AVPlayer
}

func getbundleurl(filename : String) ->URL{
    
    let bundle = Bundle.main.path(forResource: filename, ofType: "mp4")
    return URL(fileURLWithPath: bundle!)
}

var videos = [
    Video(player: AVPlayer(url: getbundleurl(filename: "v1"))),
    Video(player: AVPlayer(url: getbundleurl(filename: "Coffee - 45358"))),
    Video(player: AVPlayer(url: getbundleurl(filename: "Moon - 42422"))),
    Video(player: AVPlayer(url: getbundleurl(filename: "Owl - 56136"))),
    Video(player: AVPlayer(url: getbundleurl(filename: "Storm - 40581"))),
    Video(player: AVPlayer(url: getbundleurl(filename: "Sunset - 43292"))),
    Video(player: AVPlayer(url: getbundleurl(filename: "The Moon - 19169")))
]

