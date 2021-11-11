//
//  CodableDataURLSession.swift
//  CienDiasPaulHudson
//
//  Created by Adrian Iraizos Mendoza on 31/10/21.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct CodableDataURLSession: View {
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    /*
     Inside loadData() we have four steps we need to complete:

     1. Creating the URL we want to read.
     2. Wrapping that in a URLRequest, which allows us to configure how the URL should be accessed.
     3. Create and start a networking task from that URL request.
     4. Handle the result of that networking task.
     */
    func loadData() {
        //step 1
        guard let url = URL(string: "https://itunes.apple.com/search?term=metallica&entity=song") else {
            print("Invalid URL")
            return
        }
        //step 2
        let request = URLRequest(url: url)
        //step 3
        URLSession.shared.dataTask(with: request) { data, response, error in
            //step 4
            
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        
                        self.results = decodedResponse.results
                    }
                    return
                }
            }
            print("Fech failed: \(error?.localizedDescription ?? "Error desconocido")")
        }.resume()
    }
}

struct CodableDataURLSession_Previews: PreviewProvider {
    static var previews: some View {
        CodableDataURLSession()
    }
}
