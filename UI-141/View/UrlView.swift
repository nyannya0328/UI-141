//
//  UrlView.swift
//  UI-141
//
//  Created by にゃんにゃん丸 on 2021/03/11.
//

import SwiftUI

struct UrlView: View {
   
    @EnvironmentObject var model : AllViewModel
    @Namespace var animation
    
    let colums = Array(repeating: GridItem(.flexible(),spacing: 30), count: 2)

    var body: some View {
        VStack{
            
            HStack{
                
                Image(systemName: "creditcard.fill")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 80, height: 45)
                    .foregroundColor(model.selectedtab == "card" ? .black : .white)
                    .background(

                        ZStack{

                            if model.selectedtab != "card"{

                                Color.clear
                            }
                            else{

                                Color.white.cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)

                            }
                        }

                    )
                    
                    
                    .onTapGesture {
                        withAnimation{
                            
                            model.selectedtab = "card"
                        }
                    }
                
                
                    Text("1")
                        .frame(width: 35, height: 35)
                        .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(model.selectedtab == "car" ? Color.black : Color.white,lineWidth: 5)
                                        )
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 80, height: 45)
                    .foregroundColor(model.selectedtab == "car" ? .black : .white)
                    .background( ZStack{

                        if model.selectedtab != "car"{

                            Color.clear
                        }
                        else{

                            Color.white.cornerRadius(10)
                                .matchedGeometryEffect(id: "Tab", in: animation)

                        }
                    })
                        .onTapGesture {
                            withAnimation{
                                
                                model.selectedtab = "car"
                            }
                        }
                
                
                Image(systemName: "car.circle.fill")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 80, height: 45)
                    .foregroundColor(model.selectedtab == "fill" ? .black : .white)
                    .background( ZStack{

                        if model.selectedtab != "fill"{

                            Color.clear
                        }
                        else{

                            Color.white.cornerRadius(10)
                                .matchedGeometryEffect(id: "Tab", in: animation)

                        }
                    })
                    .onTapGesture {
                        withAnimation{
                            
                            model.selectedtab = "fill"
                        }
                    }
                
            }
            .background(Color.white.opacity(0.15))
            .cornerRadius(10)
           
            
            ScrollView{
                
                
                
                LazyVGrid(columns: colums,content: {
                    
                    ForEach(model.urls){page in
                        
                        
                        WebView(url: page.url)
                            .opacity(model.currentpage?.id == page.id ? 0.01 : 1)
                        
                            .frame(height: 250)
                            
                            
                            .onDrag {
                                //model.currentpage = page
                                
                                return NSItemProvider(contentsOf: URL(string: "\(page.id)")!)!
                                
                            }
                            .onDrop(of: [.url], delegate: DropViewDelegate(page: page, model: model))
                    }
                  
                    
                })
                .padding()
               
               
                
                
                
            
                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
        
       
    
        
      
        
        
    }
}

struct UrlView_Previews: PreviewProvider {
    static var previews: some View {
        UrlView()
    }
}
