//
//  DessertsListView.swift
//  Dessert
//
//  Created by Atharva Kulkarni on 11/03/23.
//

import SwiftUI



struct DessertsListView: View {
    
    
    @StateObject var dessertsVM = DessertsViewModel()
    @State private var imageCache = [URL: UIImage]()
    
    
    func loadImage(for url: URL, completion: @escaping (UIImage?) -> ()) {

        if let cachedImage = imageCache[url] {
            completion(cachedImage)
            return
        }
        

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Verify if the image is already in cache
            
            if let error = error {
                
                // Check for errors

                print("Error downloading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            // Verify for valid response
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode),
                  let data = data,
                  let image = UIImage(data: data) else {
                print("Invalid response or data for image: \(url.absoluteString)")
                completion(nil)
                return
            }
            
            // Storing the downloaded image in cache
            
            imageCache[url] = image
            
            // Calling the completion block with the downloaded image
            
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }

    var body: some View {
        
        NavigationStack{
            
            
            List(dessertsVM.DessertsArray.sorted(by: { $0.strMeal < $1.strMeal }),  id: \.self) {
                dessert in
                
                NavigationLink {
                    DetailView(meal:dessert)
                } label: {
                    HStack {
                        AsyncImage(url: dessert.strMealThumb) { image in
                            if let image = image {
                                
                                // Show the loaded image
                                
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                            } else {
                                
                                // Show a placeholder image
                                
                                let placeholder = UIImage(systemName: ("placeholder-image"))
                                Color.gray
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                            }
                        } placeholder: {
                            let placeholder = UIImage(systemName: ("placeholder-image"))
                            Color.gray
                                .frame(width: 60, height: 60)
                                .cornerRadius(10)
                        }
                        .onAppear {
                            if let url = dessert.strMealThumb {
                                loadImage(for: url) { image in
                                   
                                }
                            }
                        }

                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                        Text(dessert.strMeal.capitalized)
                            .font(.title2)
                    }
                    
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Desserts")
        }
        .task {
            await dessertsVM.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DessertsListView()
    }
}
