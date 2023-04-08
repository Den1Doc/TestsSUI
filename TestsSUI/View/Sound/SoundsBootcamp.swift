//
//  SoundsBootcamp.swift
//  TextSUI
//
//  Created by Денис Мишин on 07.04.2023.
//

import SwiftUI
import AVKit

class SoundManager: ObservableObject {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error \(error.localizedDescription)")
        }
    }
    
    
}

struct SoundsBootcamp: View {
    
    var body: some View {
        
        VStack(spacing: 40.0) {
            Button("Play sound") {
                SoundManager.instance.playSound(sound: .tada)
            }
            
            Button("Play sound") {
                SoundManager.instance.playSound(sound: .badum)
            }
            
            
            
        }
        
        
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
