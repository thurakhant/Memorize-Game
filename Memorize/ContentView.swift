//
//  ContentView.swift
//  Memorize
//
//  Created by Thura Khant Thein on 13/9/23.
//

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["🎃","☠️","🤡","👻"]
    var body: some View {
        HStack(content: {
            ForEach(emojis.indices , id: \.self){ index in
                CardView(content: emojis[index])
            }
        }).padding()
            .foregroundColor(.orange)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View{
    let content: String
    @State var isFacedUp = true
    
    var body: some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFacedUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else{
                base.fill()
            }
            
        }.onTapGesture {
            isFacedUp.toggle()
        }
        
    }
}
/// [Summary Note]
///
/// Views are immutable
/// @State creating a pointer to a little pieces of memory where it keep that(@State)
/// Pointer never change itself
