//
//  TextView.swift
//  UI-141
//
//  Created by にゃんにゃん丸 on 2021/03/13.
//

import SwiftUI

struct TextView: View {
    @State var multicolor = false
    var body: some View {
        VStack(spacing:25){
            
            TextShimer(multicolor: $multicolor, title: "KAVSOFT")
            
            TextShimer(multicolor: $multicolor, title: "Amazing")
            
            TextShimer(multicolor: $multicolor, title: "Awsome")
            Toggle(isOn: $multicolor, label: {
                
                Text("Enable Multi")
                    .font(.title2)
                    .bold()
                
                
            })
            .padding()
        }
       
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

struct TextShimer : View {
    @Binding var multicolor : Bool
    
    var title : String
    @State var animaiton = false
    var body: some View{
        
        ZStack{
            
            Text(title)
                .font(.system(size: 80, weight: .bold))
            
            HStack(spacing:0){
                
                
                ForEach(0..<title.count,id:\.self){index in
                    
                    
                    Text(String(title[title.index(title.startIndex,offsetBy: index)]))
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(multicolor ? RandomColor() : .white)
                }
            }
            .mask(
            
            Rectangle()
                .fill(LinearGradient(gradient: .init(colors: [.green,.blue]), startPoint: .leading, endPoint: .trailing))
                .rotationEffect(.init(degrees: 70))
                .padding(20)
                .offset(x: -260)
                .offset(x: animaiton ? 500 : 0)
               
                
            )
            .onAppear(perform: {
                
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    animaiton.toggle()
                    
                }
                
                
            })
            
        }
        
        
    }
    func RandomColor()->Color{
        
        let color = UIColor(red: 1, green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return Color(color)
    }
}
