//
//  UI_141App.swift
//  UI-141
//
//  Created by にゃんにゃん丸 on 2021/03/11.
//

import SwiftUI

@main
struct UI_141App: App {
    @StateObject var model = AllViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
