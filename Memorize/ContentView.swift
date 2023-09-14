//
//  ContentView.swift
//  Memorize
//
//  Created by Thura Khant Thein on 13/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            CardView(isFacedUp: true)
            CardView()
            CardView()
            CardView()
        })
        .foregroundColor(.orange)
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View{
    var isFacedUp: Bool = false
    
    var body: some View {
        ZStack (content : {
            if isFacedUp {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🤌").font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 12)
            }
            
        })
        
    }
}
