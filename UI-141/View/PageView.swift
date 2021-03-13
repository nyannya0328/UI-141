//
//  PageView.swift
//  UI-141
//
//  Created by にゃんにゃん丸 on 2021/03/13.
//

import SwiftUI

struct PageView: View {
    
    @State var offset : CGFloat = 0
    var body: some View {
        ScrollView(.init()){
            
            
            TabView{
                ForEach(0...5,id:\.self){index in
                    if index == 0{
                        
                        
                        Image("p\(index)")
                            .resizable()
                        
                            .overlay(
                      
                        GeometryReader{proxy -> Color in
                            
                            let minx = proxy.frame(in: .global).minX
                            
                            DispatchQueue.main.async {
                                withAnimation{
                                    
                                    self.offset = -minx
                                }
                            }
                            
                            return Color.clear
                            
                            
                            
                        }
                        .frame(width: 0, height: 0)
                        ,alignment: .leading
                      )
                    }
                    else{
                        
                        
                        Image("p\(index)")
                            .resizable()
                    }
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                HStack(spacing:15){
                    
                    
                    ForEach(0...5,id:\.self){index in
                        
                        
                        Capsule()
                            .fill(Color.white)
                            .frame(width:getindex() == index ? 20 : 7, height: 7)
                    }
                }
                .overlay(
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(width:20, height: 7)
                        .offset(x: getoffset())
                
                    ,alignment: .leading
                
                )
                .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .padding(.bottom)
                
                
                ,alignment: .bottom
            
            )
            
            
            
        }
        .ignoresSafeArea()
    }
    
    func getindex()->Int{
        
        let index = Int(round(Double(offset / getwith())))
        return index
    }
    
    func getoffset()->CGFloat{
        
        let progress = offset / getwith()
        return 22 * progress
    }
}

extension View{
    
    func getwith()->CGFloat{
        return UIScreen.main.bounds.width
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
