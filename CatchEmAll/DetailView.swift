//
//  DetailView.swift
//  CatchEmAll
//
//  Created by Christopher Kennedy on 3/12/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var creatureDetailVM = CreatureDetailViewModel()
    var creature: Creature
    var body: some View {
        VStack (alignment: .leading, spacing: 3){
            Text(creature.name.capitalized)
                .font(Font.custom("Avenir Next Condensed", size: 60))
                .bold()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .padding(.bottom)
            
            HStack{
                AsyncImage(url: URL(string: creatureDetailVM.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .background(.white)
                        .frame(maxWidth: 96)
                        .cornerRadius(16)
                        .shadow(radius: 8, x: 5, y: 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        }
                        .padding(.trailing)
                } placeholder: {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.clear)
                        .frame(maxWidth: 96, maxHeight: 96)
                }

//                Image(systemName: "figure.run.circle")
//                    .resizable()
//                    .scaledToFit()
//                    .backgroundStyle(.white)
//                    .frame(maxWidth: 96)
//                    .cornerRadius(16)
//                    .shadow(radius: 8, x: 5, y: 5)
//                    .overlay {
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(.gray.opacity(0.5), lineWidth: 1)
//                    }
//                    .padding(.trailing)
                
                VStack (alignment: .leading){
                    HStack (alignment: .top) {
                        Text("Height")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.red)
                        
                        Text(String(format: "%.1f", creatureDetailVM.height))
                            .font(.largeTitle)
                            .bold()
                    }
                    HStack (alignment: .top) {
                        Text("Weight")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.red)
                        
                        Text(String(format: "%.1f", creatureDetailVM.weight))
                            .font(.largeTitle)
                            .bold()
                    }
                }
                
                
            }
            
            Spacer()
        }
        .padding()
        .task {
            creatureDetailVM.urlString = creature.url
            await creatureDetailVM.getData()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(creature: Creature(name: "bulbasur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}
