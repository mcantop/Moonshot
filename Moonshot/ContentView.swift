//
//  ContentView.swift
//  Moonshot
//
//  Created by Maciej on 07/08/2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State var showingGrid = true
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid == true {
                    GridLayout()
                } else {
                    ListLayout()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingGrid = {
                            showingGrid == true ? false : true
                        }()
                    } label: {
                        Image(systemName: {
                            showingGrid == true ? "list.dash" : "square.grid.2x2"
                        }()
                    )}
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
