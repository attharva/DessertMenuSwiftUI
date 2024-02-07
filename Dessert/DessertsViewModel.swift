//
//  DessertsViewModel.swift
//  Dessert
//
//  Created by Atharva Kulkarni on 11/03/23.
//

import Foundation

@MainActor


class DessertsViewModel:ObservableObject {
    
    // Define a struct to represent the returned list of meals from the API
    
     struct ReturnedList:Codable {
        var meals: [Meal]
    }
    
    
    // Define published properties to store the desserts list and a single dessert
    
    @Published var DessertsArray:[Meal] = []
    @Published var meeel: Meal?
   

    // Define the base URL for the API
    
    let baseUrl = "https://themealdb.com/api/json/v1/1"

    // Define a function to get the desserts data from the API
    
    func getData() async {

        // Create the URL string for the desserts list
        
        let URLString: String = "\(baseUrl)/filter.php?c=Dessert"


        // Print the URL for debugging purposes
        
        print("We are accessing the URL \(URLString)")

        // Create a URL object from the URL string
        
        guard let url = URL(string: URLString) else {
            print("Error: Could not create a URL from \(URLString)")
            return
            
        }



        // Try to get the data from the URL using an async URLSession
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)


            guard let returned = try? JSONDecoder().decode(ReturnedList.self, from: data) else {
                print("JSON Error: Could not decode returned data")
                return
            }
            
            // Update the published DessertsArray property with the returned meals
            
            self.DessertsArray = returned.meals
            


        }
        catch {
            print("Error: Could not get a data from  \(URLString)")
        }


    }
    
    


    
}
