//
//  DetailView.swift
//  H4X0R News
//
//  Created by Nishant Taneja on 09/09/20.
//  Copyright © 2020 Nishant Taneja. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let urlString: String?
    
    var body: some View {
        WebView(urlString)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: "https://www.google.com")
    }
}
