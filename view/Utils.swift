//
//  Utils.swift
//  Steps
//
//  Created by Andres Felipe Alzate Restrepo on 08/10/2019.
//  Copyright © 2019 Andres Felipe Alzate Restrepo. All rights reserved.
//

import SwiftUI


struct TabOptions: View {
    
    var image: String = ""
    var text: String = ""
    
    var body: some View {
        VStack{
            Image(systemName: image)
            Text(text)
        }
    }
}
struct Utils_Previews: PreviewProvider {
    static var previews: some View {
        TabOptions()
    }
}
