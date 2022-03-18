//
//  ContentView.swift
//  forExampleTo
//
//  Created by Владимир Осетров on 18.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello,my world!")
                .padding()
                .font(.largeTitle.bold())
            Text ("good day = Friday")
                .padding()
                .font(.headline.monospaced().weight(.ultraLight))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
