//
//  ContentView.swift
//  UI-141
//
//  Created by にゃんにゃん丸 on 2021/03/11.0
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            
            Home()
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
