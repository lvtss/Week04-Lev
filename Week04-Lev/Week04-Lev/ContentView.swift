//
//  ContentView.swift
//  Week04-Lev
//
//  Created by Levitia on 26/02/2023.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        TabView {
            ColourView()
                .tabItem {
                    Label("Colour Sounds", systemImage: "music.note.list")
                }

            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
        }

    }

    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
