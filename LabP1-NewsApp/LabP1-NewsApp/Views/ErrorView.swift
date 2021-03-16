//
//  ErrorView.swift
//  LabP1-NewsApp
//
//

import SwiftUI

struct ErrorView: View {
    
    let error: Error
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError)
    }
}
