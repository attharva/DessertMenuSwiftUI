//
//  DessertDetailViewModel.swift
//  Dessert
//
//  Created by Atharva Kulkarni on 12/03/23.
//

import Foundation


@MainActor


class DessertDetailViewModel:ObservableObject {
    
    // Published property to hold the details of the selected meal
    
    @Published var meal: MealDetails?

    // Struct to decode the response from API
    
    struct MealListResponse: Codable {
        let meals: [MealDetails]?
    }
    
    // Function to fetch the details of a meal by its ID
    
    func fetchMealDetails(byId id: String) async  {
        
        do {
            let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let mealResponse = try JSONDecoder().decode(MealListResponse.self, from: data)
            
            // If a meal is fetched, update the published property on the main thread
            
            if let fetchedMeal = mealResponse.meals?.first {
                DispatchQueue.main.async {
                    self.meal = fetchedMeal
                    
                }
            } else {
                print("Error: Unable to fetch meal details.")
            }
        } catch {
            print("Error: \(error)")
        }
  
    }
    

 
    
}
