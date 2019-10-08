//
//  Main.swift
//  Steps
//
//  Created by Andres Felipe Alzate Restrepo on 04/10/2019.
//  Copyright © 2019 Andres Felipe Alzate Restrepo. All rights reserved.
//

import SwiftUI

struct Main: View {

    @State var selection = 0
 
    var body: some View {
        
        TabView(selection: $selection) {
            
            WalletTab()
                .tabItem { TabOptions(image: "bitcoinsign.circle", text: "Monedero") }.tag(0)
            RedeemTab()
                .tabItem { TabOptions(image: "qrcode.viewfinder", text: "Canjear") }.tag(1)
            ActivityTab()
                .tabItem { TabOptions(image: "waveform.path", text: "Actividad") }.tag(2)
            StoreTab()
                .tabItem { TabOptions(image: "cart", text: "Tienda") }.tag(3)
            ConfigurationTab()
                .tabItem { TabOptions(image: "gear", text: "Configuración") }.tag(4)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}


