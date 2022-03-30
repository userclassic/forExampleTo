//
//  ContentView.swift
//  forExampleTo
//
//  Created by Владимир Осетров on 18.03.2022.
//

import SwiftUI
extension View {

    func centerH() -> some View {
        HStack {
            Spacer()
            self
                .padding()
                .myFont()
            Spacer()
        }
    }

    func myFont() -> some View {
        self
            .font(.headline.weight(.bold).monospaced())
    }

}
// работает не со всеми ссылками, YouTube - ok

struct ContentView: View {
    @StateObject var shortURL = URLShortManager()

    var body: some View {
        VStack {
            Form {
                Section("Some") {
                    TextEditor(text: $shortURL.inputURL)
                        .frame(height:100)
                    Button("Submit") {
                        if shortURL.inputURL.isEmpty {
                            shortURL.resultURL = "Please add url"
                        } else {
                            shortURL.resultURL = "Loading"
                            shortURL.getData()
                        }
                    }.centerH()
                }.font(.body.monospaced())
                Section("Results") {
                    TextField("Your shorted link appaer hire", text: $shortURL.resultURL)
                        .textSelection(.enabled)
                        .foregroundColor(.indigo)
                    Button("Reset") {
                        shortURL.inputURL = ""
                        shortURL.resultURL = ""
                    }
                    .centerH()
                    .foregroundColor(.red)
                }.font(.body.monospaced())
            }
            .environmentObject(shortURL)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
