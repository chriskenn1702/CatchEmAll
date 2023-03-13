//
//  CreatureDetailViewModel.swift
//  CatchEmAll
//
//  Created by Christopher Kennedy on 3/12/23.
//

import Foundation

@MainActor
class CreatureDetailViewModel: ObservableObject{
    
    private struct Returned: Codable{
        var height: Double
        var weight: Double
        var sprites: Sprite
    }
    
    struct Sprite: Codable{
        var front_default: String
    }
    
    var urlString = ""
    @Published var height = 0.0
    @Published var weight = 0.0
    @Published var imageURL = ""

    
    func getData() async{
        print("We are accesing the url \(urlString)")
        
        guard let url = URL(string: urlString) else{
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let returned  = try? JSONDecoder().decode(Returned.self, from: data) else{
                print("JSON ERROR: Could not decode returned JSON data")
                return
            }
            self.height = returned.height
            self.weight = returned.weight
            self.imageURL = returned.sprites.front_default
        } catch{
            print("ERROR: Could not use URL at \(urlString) to get data and response")
        }
    }
    
}
