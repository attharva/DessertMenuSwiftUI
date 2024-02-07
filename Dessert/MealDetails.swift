//
//  MealDetails.swift
//  Dessert
//
//  Created by Atharva Kulkarni on 12/03/23.
//

import Foundation
struct MealDetails: Codable {
    let name: String
    let area: String
    let id: String
    
    let instructions: String
    let imageURL: URL?
    
    let ingredient1:String?
    let measurement1:String?
    
    let ingredient2:String?
    let measurement2:String?
    
    let ingredient3:String?
    let measurement3:String?
    
    let ingredient4:String?
    let measurement4:String?
    
    let ingredient5:String?
    let measurement5:String?
    
    let ingredient6:String?
    let measurement6:String?
    
    let ingredient7:String?
    let measurement7:String?
    
    let ingredient8:String?
    let measurement8:String?
    
    let ingredient9:String?
    let measurement9:String?
    
    
    let ingredient10:String?
    let measurement10:String?
    
    let ingredient11:String?
    let measurement11:String?
    
    let ingredient12:String?
    let measurement12:String?
    
    let ingredient13:String?
    let measurement13:String?

    let ingredient14:String?
    let measurement14:String?
    
    let ingredient15:String?
    let measurement15:String?

    
    let ingredient16:String?
    let measurement16:String?

    let ingredient17:String?
    let measurement17:String?
    

    let ingredient18:String?
    let measurement18:String?

    let ingredient19:String?
    let measurement19:String?

    let ingredient20:String?
    let measurement20:String?

    
    
    
    var ingredientsAndMeasurements: [(String, String)] {
        var ingredients = [(String, String)]()
        
        if let ingredient = ingredient1, let measurement = measurement1 {
                  ingredients.append((ingredient, measurement))
              }
        
        
        if let ingredient = ingredient2, let measurement = measurement2 {
                  ingredients.append((ingredient, measurement))
              }
        
        if let ingredient = ingredient3, let measurement = measurement3 {
                  ingredients.append((ingredient, measurement))
              }
        
        if let ingredient = ingredient4, let measurement = measurement4 {
                  ingredients.append((ingredient, measurement))
              }
        
        if let ingredient = ingredient5, let measurement = measurement5 {
                  ingredients.append((ingredient, measurement))
              }
        
        if let ingredient = ingredient6, let measurement = measurement6 {
                  ingredients.append((ingredient, measurement))
              }
        
        if let ingredient = ingredient7, let measurement = measurement7 {
                  ingredients.append((ingredient, measurement))
              }
        
        if let ingredient = ingredient8, let measurement = measurement8 {
                  ingredients.append((ingredient, measurement))
              }
        
        if let ingredient = ingredient9, let measurement = measurement9 {
                  ingredients.append((ingredient, measurement))
              }
        
        if let ingredient = ingredient10, let measurement = measurement10 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient11, let measurement = measurement11 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient12, let measurement = measurement12 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient13, let measurement = measurement13 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient14, let measurement = measurement14 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient15, let measurement = measurement15 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient16, let measurement = measurement16 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient17, let measurement = measurement17 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient18, let measurement = measurement18 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient19, let measurement = measurement19 {
                  ingredients.append((ingredient, measurement))
              }
        if let ingredient = ingredient20, let measurement = measurement20 {
                  ingredients.append((ingredient, measurement))
              }
        
       
        return ingredients
        
        
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case area = "strArea"
        case id = "idMeal"
        
        case instructions = "strInstructions"
        case imageURL = "strMealThumb"
        
        case ingredient1 = "strIngredient1"
        case measurement1 = "strMeasure1"
        
        case ingredient2 = "strIngredient2"
        case measurement2 = "strMeasure2"
        
        case ingredient3 = "strIngredient3"
        case measurement3 = "strMeasure3"
        
        case ingredient4 = "strIngredient4"
        case measurement4 = "strMeasure4"
        
        case ingredient5 = "strIngredient5"
        case measurement5 = "strMeasure5"
        
        case ingredient6 = "strIngredient6"
        case measurement6 = "strMeasure6"
        
        case ingredient7 = "strIngredient7"
        case measurement7 = "strMeasure7"
        
        case ingredient8 = "strIngredient8"
        case measurement8 = "strMeasure8"
        
        case ingredient9 = "strIngredient9"
        case measurement9 = "strMeasure9"
        
        case ingredient10 = "strIngredient10"
        case measurement10 = "strMeasure10"
        
        case ingredient11 = "strIngredient11"
        case measurement11 = "strMeasure11"
        
        case ingredient12 = "strIngredient12"
        case measurement12 = "strMeasure12"
        
        case ingredient13 = "strIngredient13"
        case measurement13 = "strMeasure13"
        
        case ingredient14 = "strIngredient14"
        case measurement14 = "strMeasure14"
        
        case ingredient15 = "strIngredient15"
        case measurement15 = "strMeasure15"
        
        case ingredient16 = "strIngredient16"
        case measurement16 = "strMeasure16"
        
        case ingredient17 = "strIngredient17"
        case measurement17 = "strMeasure17"
        
        case ingredient18 = "strIngredient18"
        case measurement18 = "strMeasure18"
        
        case ingredient19 = "strIngredient19"
        case measurement19 = "strMeasure19"
        
        case ingredient20 = "strIngredient20"
        case measurement20 = "strMeasure20"
        
      

    
    }
    

    
}
