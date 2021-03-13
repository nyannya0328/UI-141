//
//  Home.swift
//  UI-141
//
//  Created by にゃんにゃん丸 on 2021/03/11.
//

import SwiftUI

struct Home: View {
    @Environment(\.colorScheme) var scheme
    @Namespace var animation
    @StateObject var model = AllViewModel()
    var body: some View {
        ZStack{
            
            VStack{
                
                HStack{
                    
                   
                        
                        
                    NavigationLink(destination: UrlView()) {
                        
                        Image(systemName: "figure.walk")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                        
                        
                    }
                            
                            
                   
                    NavigationLink(destination: TextView()) {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                        
                    }
                    
                    
                       
                        
                  
                    
                    Spacer()
                    
                    NavigationLink(destination: PageView()) {
                        
                        Image(systemName: "figure.wave")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                        
                    }
                   
                        
                  
                    
                    
                    
                }
               .padding(.horizontal)
                .padding(.vertical,10)
                .overlay(
                
                Text("Discover")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                    
                    
                )
                .background(scheme == .dark ? Color.black : Color.white)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                
                
                ScrollView{
                    
                    let colums = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
                    
                    LazyVGrid(columns: colums,content: {
                        
                        ForEach(videos){video in
                            
                            
                            VideoPlayerView(player: video.player)
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: video.id, in: animation)
                                .scaleEffect(model.shoplayer && model.selectedvideo.id == video.id ? model.scale : 1)
                                .frame(width : (UIScreen.main.bounds.width - 45) / 2,height: 280)
                                .onTapGesture(perform: {
                                    model.selectedvideo = video
                                    model.shoplayer = true
                                })
                                .zIndex(0)
                            
                        }
                        
                        
                        
                    })
                    .padding()
                   
                    
                    
                    
                    
                }
            }
            
            if model.shoplayer{
                
                VideoPlayerView(player: model.selectedvideo.player)
                    .cornerRadius(15)
                    .scaleEffect(model.scale)
                    .matchedGeometryEffect(id: model.selectedvideo.id, in: animation)
                    .offset(model.offset)
                    .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnded(value:)))
                    .onAppear(perform: {
                        model.selectedvideo.player.play()
                    })
                    .ignoresSafeArea(.all, edges: .all)
                    .zIndex(3)
                
            }
        }
       
       
    }
    func onChanged(value : DragGesture.Value){
        
        if value.translation.height > 0{
            
            model.offset = value.translation
            
            let screenheight = UIScreen.main.bounds.height - 50
            
            let progress = model.offset.height / screenheight
            
            if 1 - progress > 0.5{
                
                model.scale = 1 - progress
            }
        }
        
        
    }
    
    func onEnded(value : DragGesture.Value){
        
        withAnimation(.default){
            
            if value.translation.height > 300{
                model.selectedvideo.player.pause()
                
                model.shoplayer = false
            }
            
            model.offset = .zero
            model.scale = 1
            
        }
        
        
    }

    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
