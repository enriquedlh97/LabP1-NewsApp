//
//  ErrorView.swift
//  LabP1-NewsApp
//
//

import SwiftUI

struct ErrorView: View {
    
    let error: Error
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            Text("Something went wrong!")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError)
    }
}
