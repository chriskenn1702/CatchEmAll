//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Christopher Kennedy on 3/12/23.
//

import SwiftUI

struct CreaturesListView: View {
    var creatures = ["Pikachu", "Squirtle", "Charzard", "Snorlax"]
    var body: some View {
        NavigationStack{
            List(creatures, id: \.self){creature in
                    Text(creature)
                        .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreaturesListView()
    }
}
