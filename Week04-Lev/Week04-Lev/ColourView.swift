//
//  ColourView.swift
//  Week04-Lev
//
//  Created by Levitia on 26/02/2023.
//

import Foundation
import SwiftUI
import AVKit

//class SoundManager {
//
//    static let instance = SoundManager()
//
//    var player: AVAudioPlayer?
//    enum SoundOption: String {
//        case Pink
//        case Red
//        case Orange
//        case Yellow
//        case Green
//        case Teal
//        case Blue
//        case Indigo
//        case Purple
//        case Brown
//        case Gray
//    }


//func playSound(sound: SoundOption) {
//
//    guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
//            do{
//        player = try AVAudioPlayer(contentsOf: url)
//        player?.play()
//    } catch let error {
//    print("Error playing sound. \(error.localizedDescription)")
//    }
//}
//}


let bundleAudio = [
  "Pink.mp3",
  "Red.mp3",
  "Orange.mp3",
  "Yellow.mp3",
  "Green.mp3",
  "Green.mp3",  // .mint missing
  "Teal.mp3",
  "Blue.mp3",
  "Indigo.mp3",
  "Purple.mp3",
  "Brown.mp3",
  "Gray.mp3",];

//    .pink,
//    .red,
//    .orange,
//    .yellow,
//    .green,
//    .mint,
//    .teal,
//    .blue,
//    .indigo,
//    .purple,
//    .brown,
//    .gray

func loadBundleAudio(_ fileName:String) -> AVAudioPlayer? {
  let path = Bundle.main.path(forResource: fileName, ofType:nil)!
  let url = URL(fileURLWithPath: path)
  do {
    return try AVAudioPlayer(contentsOf: url)
  } catch {
    print("loadBundleAudio error", error)
  }
  return nil
}


struct ColourView: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)

    @State private var selectedColor = Color.gray
//    @State private var soundIndex = 0
//    @State private var soundFile = bundleAudio[0]
    @State private var player: AVAudioPlayer? = nil
    
    //@State private var selectedAudioColor = []
    

    // Consider createing a struct to color and associated mp3 file
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
    
//    var soundManager = SoundManager ()

    var body: some View {
        VStack {
            //TITLE TEXT
            Text("How I Think Colour Sounds Like")
                //.font(.title)
                .font(.system(size: 38))
                .fontWeight(.semibold)
                .foregroundColor(selectedColor)
                .padding(10)
            
//            Button("Tap here to Stop Audio") {
//
//                player?.stop()
//
//            }
            
            Button(action: {
              // Toggle timer on/off.
                player?.stop()
            }) {
              // Start / Stop Button
                Text("Tap here to Stop audio")
                .font(.system(size: 20))
                .frame(width: 250, height: 65)
                .background(Color.white)
                .foregroundColor(Color.blue)
                .cornerRadius(30)
            }
            
            //COLOUR GRID
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    //
                    
                    ForEach(0 ..< allColors.count) { index in
//                        ForEach(allColors, id: \.description) { color in
                        let color = allColors[index]
                        let soundFile = bundleAudio[index]
                        Button {
//                            SoundManager.instance.playSound(sound: .Red)
                            player = loadBundleAudio(soundFile)
                            print("player", player as Any)
                            // Loop indefinitely
                            player?.numberOfLoops = -1
                            player?.play()
//                            soundIndex = (soundIndex+1) % bundleAudio.count
//                            soundFile = bundleAudio[soundIndex];
                            //player?.stop()
                            selectedColor = color
                        //UI Format for each colour grid
                        } label: {
                            RoundedRectangle(cornerRadius: 4.0)
                                .aspectRatio(0.9, contentMode: ContentMode.fit)
                                .foregroundColor(color)
                            
                            //for i in 0..<allColors.count {
                                
                            //print("\(allColors[i])")
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
