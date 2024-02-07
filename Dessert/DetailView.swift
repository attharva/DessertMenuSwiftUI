//
//  DetailView.swift
//  Dessert
//
//  Created by Atharva Kulkarni on 11/03/23.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel = DessertDetailViewModel()
    
    
    // the meal to be displayed
    
    var meal: Meal
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 7){
                
                // Title of the meal
                
                Text(meal.strMeal.capitalized)
                    .font(Font.custom("Avenir Next Condensed", size: 60))
                    .bold()
                    .foregroundColor(.accentColor)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                
                // Display the image of the meal asynchronously
                
                AsyncImage(url: viewModel.meal?.imageURL, content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipped()
                }, placeholder: {
                    Image(systemName:"figure.run.circle")
                        .resizable()
                        .scaledToFit()
                })
                .frame(width: 200, height: 200)
                
                
                // Display information about the meal
                
                Group {
                    HStack {
                        Text("Country of Origin:")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.teal)
                        Text((viewModel.meal?.area ?? viewModel.meal?.area) ?? "")
                            .font(.title2)
                    }
                    Divider().background(Color.gray)
                    
                    // Ingredients and their measurements
                    
                    Text("Ingredients & Measurements:")
                        .font(.title2)
                        .foregroundColor(.pink)
                        .bold()
                    
                    if let meal = viewModel.meal {
                        ForEach(meal.ingredientsAndMeasurements.filter { !$0.0.isEmpty && !$0.1.isEmpty }, id: \.0) { ingredient, measurement in
                            HStack {
                                Text(ingredient.capitalized)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text("-")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(measurement)
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    Divider().background(Color.orange)
                    
                    // Recipe instructions
                    
                    Text("Recipe:")
                        .foregroundColor(.orange)
                        .font(.title2)
                        .bold()
                    Text((viewModel.meal?.instructions ?? viewModel.meal?.instructions) ?? "")
                        .font(.body)
                        .multilineTextAlignment(.leading)
         
                    
                }
     
                
            }
            
            .padding(.horizontal, 20)
            .task {
                
                // Fetch meal details when the view appears
                
                await viewModel.fetchMealDetails(byId:meal.idMeal)
                
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(meal: Meal(strMeal: "", idMeal: ""))
        
    }
}
