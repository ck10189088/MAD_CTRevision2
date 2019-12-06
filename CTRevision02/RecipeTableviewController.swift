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
    var recipe : [NSManagedObject] = []
    var ingredient :[NSManagedObject] = []
    let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    let context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRecipeData()
        fetchIngredientData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func fetchRecipeData(){
        
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
    }
}
