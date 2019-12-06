//
//  RecipeTableviewController.swift
//  CTRevision02
//
//  Created by MAD2_P02 on 5/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RecipeTableViewController : UITableViewController {
    var recipe : [Recipe] = []
    var ingredient :[Ingredient] = []
    let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var addrecipevc:AddRecipeViewController = AddRecipeViewController() // create this var in order to call the method in AddRecipeViewController
        recipe = addrecipevc.fetchRecipe()
        
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let reciperow = recipe[indexPath.row]
        cell.textLabel!.text = "\(reciperow.name), \(reciperow.preparationTime)"
        let addrecipevc : AddRecipeViewController = AddRecipeViewController()
        ingredient = addrecipevc.fetchIngredient(recipe: reciperow)
        var s = ""
        for ing in ingredient{
            s += "\(ing.name)"
        }
        cell.detailTextLabel!.text = s
        
        return cell
    }
    
    /*func fetchRecipeData(){
        
        let fetchrecipe = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        do{ // fetchrecipe confirm return list
            recipe = try context.fetch(fetchrecipe)
        }catch let error as NSError{
            print("Could not fetch from CDRecipe")
        }
    }
    
    func fetchIngredientData(){
        let fetchingredient = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        do{
            ingredient = try context.fetch(fetchingredient)
        }catch let error as NSError{
            print("Could not fetch from CDIngredient")
        }
    }*/
}
