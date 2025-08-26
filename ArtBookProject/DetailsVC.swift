//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Burak Kaymak on 22.08.2025.
//

import UIKit
import CoreData

class DetailsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPainting != "" {
            
            saveButton.isHidden = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id=%@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String 
                    {
                        nameText.text = name
                    }
                    
                    if let artist = result.value(forKey: "artist") as? String
                    {
                        artistText.text = artist
                    }
                    
                    if let year = result.value(forKey: "year") as? Int 
                    {
                        yearText.text = String(year)
                    }
                    
                    if let imageData = result.value(forKey: "image") as? Data 
                    {
                        let image = UIImage(data: imageData)
                        imageView.image = image 
                    }
                }
        
            } catch{
                print("error")
            }
            
            
        } 
        
        else
        {
            saveButton.isHidden = false
            saveButton.isEnabled = false
        }
        
        
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapGestureRecognizer)

        
    }
    
    
    
    
    @IBAction func savebuttonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(artistText.text!, forKey: "artist")
        
        if let year = Int(yearText.text!)
        {
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        
        
        do{
            try context.save()
        }  catch{
            print("error")
        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true) // önceki viewcontroller'a döndürür.
        
        
        
    }
    
   
    
    @objc func hideKeyboard(){
        
        /*
         
         bu kez belli bir image veya label değil de direkt view yani ekranın herhangi bir yerine
         tıklandığında enEditing(true) yani ne yapılıyorsa son veriyor. Klavye açık olduğuna göre
         klavyeyi de kapatabilir. Klavyeyi kapatmanın amacı datalar girildikten sonra
         save butonuna erişebilmek.
         
        */
        view.endEditing(true)
    }
    
    
    @objc func selectImage(){
        let picker = UIImagePickerController() // görsel seçmeme yarayacak.
        picker.delegate = self // tableview gibi yapmak durumundayım. Kalıtım alacağı sınıflar yine eklendi.
        picker.sourceType = .photoLibrary // fotoğraf kütüphanesinin açılacağını bildirir.
        picker.allowsEditing = true // kullanıcı ekleyeceği görseli eklemeden önce editleyebilir.
        present(picker, animated: true, completion: nil) // present ile birlikte fotoğraf kütüphane ekranı açılır.
        
    }
    
    
    //görsel seçme ekranım bitince ne yapayım??
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil) // dismiss kapatmaya yarar.
    }
    
    
    
   

}
