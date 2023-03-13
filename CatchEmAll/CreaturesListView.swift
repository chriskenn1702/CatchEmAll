//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Christopher Kennedy on 3/12/23.
//

import SwiftUI

struct CreaturesListView: View {
    @StateObject var creaturesVM = CreaturesViewModel()
    var body: some View {
        NavigationStack{
            List(creaturesVM.creaturesArray, id: \.self) { creature in
                Text(creature.name)
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreaturesListView()
    }
}
