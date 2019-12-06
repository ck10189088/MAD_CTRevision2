//
//  AddRecipeViewController.swift
//  CTRevision02
//
//  Created by MAD2_P02 on 6/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddRecipeViewController : UIViewController{
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!
    var ingredientList : [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientList = [txtIngredient1,txtIngredient2,txtIngredient3,txtIngredient4,txtIngredient5]
    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
        var x : Int8 = 0
        if((txtTitle.text)as! String == "" || (txtPreparationTime.text)as! String == ""){
            let alertv = UIAlertController(title: "Empty Field", message: "Please populate the title and preparation time", preferredStyle: UIAlertController.Style.alert)
            alertv.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: {_ in}))
            self.present(alertv,animated: true,completion: nil)
            for i in ingredientList{
                if((i.text) as! String != ""){
                    x+=1
                }
            }
            if(x == 0){
                let altv = UIAlertController(title: "Empty Field", message: "Please fill in at least one ingredient", preferredStyle: UIAlertController.Style.alert)
                altv.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: {_ in}))
                self.present(altv,animated: true,completion: nil)
            }
        }
        /*for i in ingredientList{
            if((i.text) as! String != ""){
                x+=1
            }
        }
        if(x == 0){
            let altv = UIAlertController(title: "Empty Field", message: "Please fill in at least one ingredient", preferredStyle: UIAlertController.Style.alert)
            altv.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: {_ in}))
            self.present(altv,animated: true,completion: nil)
        }*/
        
        else{
            let time =  Int16(txtPreparationTime.text!)
            AddRecipe(newrecipe: Recipe(name: txtTitle.text ?? "", preparationTime: /*Int(txtPreparationTime.text!) as! String)*/time!))
            AddIngredients(recipe: Recipe(name: txtTitle.text ?? "", preparationTime: time!), newingredient: Ingredient(name: txtIngredient1.text ?? ""))
            
            let saveAlert = UIAlertController(title: "Save Successfully", message: "You have saved successfully", preferredStyle: UIAlertController.Style.alert)
            saveAlert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: {_ in}))
            self.present(saveAlert,animated: true,completion: nil)
            /*let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let cdrecipe = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)!
            let recipe = NSManagedObject(entity: cdrecipe,insertInto: context)
            recipe.setValue((txtTitle.text) as! String, forKey: "name")
            recipe.setValue(Int((txtPreparationTime.text) as! String), forKey: "preparationTime")
            
            let cdingredient = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)!
            let ingredient = NSManagedObject(entity: cdingredient, insertInto: context)
            for i in ingredientList{
                if((i.text) as! String != ""){
                    ingredient.setValue((i.text) as! String, forKey: "name")
                }
            }
            
            do{
                try context.save()
                let saveAlert = UIAlertController(title: "Save Successfully", message: "You have saved successfully", preferredStyle: UIAlertController.Style.alert)
                saveAlert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: {_ in}))
                self.present(saveAlert,animated: true,completion: nil)
            }catch let error as NSError{
                let failsaveAlert = UIAlertController(title: "\(error)", message: "Error : \(error.userInfo)", preferredStyle: UIAlertController.Style.alert)
                failsaveAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {_ in}))
                self.present(failsaveAlert,animated: true,completion: nil)
            }*/
        }
        
    }
        
        func AddRecipe(newrecipe : Recipe){
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let cdrecipe = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)!
            
            let recipe = NSManagedObject(entity: cdrecipe, insertInto: context)
            recipe.setValue(newrecipe.name, forKey: "name")
            recipe.setValue(newrecipe.preparationTime, forKey: "preparationTime")
            
            appDelegate.saveContext()
        }
        
        func fetchRecipe() -> [Recipe]{
            var recipe : [CDRecipe] = [] // why is [CDRecipe instead of NSManagedObject]
            var recipeList : [Recipe] = []
            
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
            do{
                recipe = try context.fetch(fetchRequest) as! [CDRecipe] //must put as! [CDRecipe]
                
                for r in recipe{
                    recipeList.append(Recipe(name: r.name!, preparationTime: r.preparationTime))//if use CDRecipe, after the r.name must have !, why?
                }
            }catch{
                print(error)
            }
            return recipeList
        }
        
        func AddIngredients(recipe : Recipe , newingredient : Ingredient){ // add ingredients to recipe
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let cdIngredient = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)!
            
            let ingredient = NSManagedObject(entity: cdIngredient, insertInto: context)
            ingredient.setValue(newingredient.name, forKey: "name")
            
            let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")// fetch the core data "CDRecipe"
            fetchrequest.predicate = NSPredicate(format: "name =  %@", recipe.name) // this is like the where condition in sql
            do{
                let cdRecipe = try context.fetch(fetchrequest)
                //ingredient.addtoRei
                appDelegate.saveContext()
            }catch{
                print(error)
            }
        }
        
        func fetchIngredient(recipe : Recipe) -> [Ingredient]{
            var ingredientList : [Ingredient] = []
            var ingredient : [CDIngredient] = []
            
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
            fetchRequest.predicate = NSPredicate(format: "ANY recipes.name = %@", recipe.name) // only fetch the ingredient with the correct recipe name
            do{
                let cdIngredient = try context.fetch(fetchRequest) as! [CDIngredient]
                
                for ing in cdIngredient{
                    ingredientList.append(Ingredient(name: ing.name!)) // must have ! after name
                }
            }catch{
                print(error)
            }
            return ingredientList
        }
            
}
    
