//
//  ContentView.swift
//  OverlayTester
//
//  Created by Shota Shimazu on 2023/03/19.
//

import SwiftUI
import OverlayDHT

struct ContentView: View {
    
    @State var bindingPort = ""
    var body: some View {
        VStack {
            VStack {
                TextField("PORT", text: $bindingPort)
                TextField("BTSTRP", text: $bindingPort)

                Button("LAUNCH") {
                    overlay()
                }
            }
        }
        .padding()
    }
    

    func overlay()  {
        
        let port: Int = Int(bindingPort) ?? 1234
        
        let overlay = OverlayDHT(
            bootstrap: Bootstrap(addr: "localhost", port: UInt16(port))
        )
        
        Task {
            try! await overlay.ping(id: 2923)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
