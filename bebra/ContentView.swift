//
//  ContentView.swift
//  bebra
//
//  Created by Александр Фида on 01.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bebraCount = 0
    @State private var maxBebra = 0
    @State private var bebraSize = 1
    
    var body: some View {
        NavigationView{
            Form{
                Section("Counter"){
                    Text("Bebra's: \(bebraCount)")
                    Text("Maximum bebra \(maxBebra)")
                }
                Button(action: {
                    self.bebraCount += self.bebraSize + 1
                    if self.maxBebra < self.bebraCount {
                        self.maxBebra = self.bebraCount
                    }
                }, label: {
                    Text("Add bebra")
                })
                Picker("Bebra size", selection: $bebraSize){
                    ForEach(1..<5){
                        Text("\($0)")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Section(header: Text("Forget bebra's")){
                    Button(action: {
                        self.bebraCount = 0
                    }, label: {
                        Text("Clear bebra")
                    })
                }
            }.navigationBarTitle("Bebra clicker", displayMode: .inline)
        }
    }
    
    private var splashImageBackground: some View {
        GeometryReader { geometry in
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
