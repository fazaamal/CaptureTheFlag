//
//  Stacks.swift
//  CaptureTheFlag
//
//  Created by Faza Amal Sophian on 04/07/2024.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
        ZStack{
            Color.red
            HStack{
                Color.blue
                VStack(spacing: 100){
                    Text("1").padding(20)
                    Text("1")
                    Text("1")
                }.padding(30)
                VStack{
                    Text("1")
                    Text("1")
                    Text("1")
                }
                VStack{
                    Text("1")
                    Text("1")
                    Text("1")
                }
            }.background(Color(.black)).opacity(0.3)
            HStack{
                VStack(spacing: 30){
                    Text("1").padding(20)
                    Text("1")
                    Text("1")
                }.padding(30)
                VStack{
                    Text("1")
                    Text("1")
                    Text("1")
                }
                VStack{
                    Text("1")
                    Text("1")
                    Text("1")
                }
            }.background(LinearGradient(colors: [.blue, .red], startPoint: .top, endPoint: .bottom)).opacity(0.3)
        }.ignoresSafeArea()
    }
}

#Preview {
    Stacks()
}
