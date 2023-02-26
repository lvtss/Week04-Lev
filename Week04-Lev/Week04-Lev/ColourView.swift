//
//  ColourView.swift
//  Week04-Lev
//
//  Created by Levitia on 26/02/2023.
//

import Foundation
import SwiftUI
import AVKit

class SoundManager {

    static let instance = SoundManager()

    var player: AVAudioPlayer?
    enum SoundOption: String {
        case Pink
        case Red
        case Orange
        case Yellow
        case Green
        case Teal
        case Blue
        case Indigo
        case Purple
        case Brown
        case Gray
    }


func playSound(sound: SoundOption) {

    guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
            do{
        player = try AVAudioPlayer(contentsOf: url)
        player?.play()
    } catch let error {
    print("Error playing sound. \(error.localizedDescription)")
    }
}
}


struct ColourView: View {
    let columnLayout = Array(repeating: GridItem(), count: 3)

    @State private var selectedColor = Color.gray

    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]
    
    var soundManager = SoundManager ()

    var body: some View {
        VStack {
            //TITLE TEXT
            Text("How I Think Colour Sounds Like")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(selectedColor)
                .padding(10)
            
            //COLOUR GRID
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(allColors, id: \.description) { color in
                        Button {
                            SoundManager.instance.playSound(sound: .Pink)
                            selectedColor = color
                        } label: {
                            RoundedRectangle(cornerRadius: 4.0)
                                .aspectRatio(0.9, contentMode: ContentMode.fit)
                                .foregroundColor(color)
                        }
                        .buttonStyle(.automatic)
                        

                    }
                }
            }
        }
        .padding(15)
    }
}



struct ColourView_Previews: PreviewProvider {
    static var previews: some View {
        ColourView()
    }
}
