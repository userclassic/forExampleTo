//
//  NewtView.swift
//  forExampleTo
//
//  Created by Владимир Осетров on 21.03.2022.
//

import SwiftUI

struct NewtView: View {
    var body: some View {
        Button("Tap on me") {
            print("Tapped!")
        }
        .foregroundColor(.purple)
        .centerH()

    }
}

struct NewtView_Previews: PreviewProvider {
    static var previews: some View {
        NewtView()
    }
}
