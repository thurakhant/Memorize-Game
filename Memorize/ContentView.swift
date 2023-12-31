//
//  ContentView.swift
//  Memorize
//
//  Created by Thura Khant Thein on 13/9/23.
//

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["🎃","☠️","🤡","👻","😈","👽","🤖","👁️","👶","🦷","👹","👨‍💻"]
    @State var cardCount : Int = 2
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    func cardCountAdjusterFun (by offset: Int , symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName:symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cards : some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount , id : \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }.foregroundColor(.orange)
        }
    }
    
    var cardRemover : some View {
        cardCountAdjusterFun(by: -1, symbol: "minus")
    }
    
    var cardAdder : some View {
        cardCountAdjusterFun(by: +1, symbol: "plus")
    }
    
    var cardCountAdjuster : some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
    }
}

struct CardView: View{
    let content: String
    @State var isFacedUp = true
    
    var body: some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)
            base.fill().opacity(isFacedUp ? 0 : 1)
            
        }.onTapGesture {
            isFacedUp.toggle()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/// [
/// Summary Note
/// ]
///
/// Views are immutable
/// @State creating a pointer to a little pieces of memory where it keep that(@State)
/// Pointer can't change itself
///
