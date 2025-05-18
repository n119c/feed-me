//
//  Recipe.swift
//  feed me
//
//  Created by Nick van Tilburg on 18/5/2025.
//

import Foundation

struct Recipe {
    
    var name: String
    var servings: Int
    var calories: Double
    var macros: Macros
    var ingredients: [Ingredient]
    var method: [String]
    
    struct Macros {
        var protein: Int
        var carbs: Int
        var fats: Int
    }
    
    struct Ingredient {
        var name: String
        var quantity: Double
        var unit: Unit
        
        var description: String {
            // format the double into a string and drop trailing zeroes with %g
            let formattedQuantity = String(format: "%g", quantity)
            
            switch unit {
                // if there are no units format the name to have an s on the end if > 1
                case .none:
                    let formattedName = quantity == 1 ? name : "\(name)s"
                    return "\(formattedQuantity) \(formattedName)"
                default:
                    return "\(formattedQuantity) \(unit.rawValue) \(name)"
            }
        }
        
        enum Unit: String, CaseIterable {
            case g
            case kg
            case mL
            case L
            case cups
            case tbsp
            case tsp
            case none = "no units"
        }
    }
}
