//
//  ViewController.swift
//  FootTracker
//
//  Created by Szymon Biliński on 05/03/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var textFieldMeal: UITextField!
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldMeal.delegate = self
    }
    
    @IBAction func setName(_ sender: UIButton) {
        mealLabel.text = textFieldMeal.text
    }
    
    @IBAction func tapImage(_ sender: Any) {
        textFieldMeal.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        viewImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}

