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
        if((txtTitle.text) as! String == "" && (txtPreparationTime.text) as! String == ""){
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
        
        func AddRecipe(newrecipe : Recipe){
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let cdrecipe = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)!
            
            let recipe = NSManagedObject(entity: cdrecipe, insertInto: context)
            recipe.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
        }
    }
            
}
    
