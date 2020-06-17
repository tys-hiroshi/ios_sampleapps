//
//  ViewController.swift
//  ios_sampleapp
//
//  Created by macmini on 2020/06/16.
//  Copyright © 2020 hblockth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Handle the text field’s user input through delegate callbacks.
        //https://qiita.com/narukun/items/326bd50a78cf34371169
        nameTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.selectImageFromPhotoLibrary(_:)))
        tapGesture.delegate = self
        //selectImageFromPhotoLibrary(tapGesture);
        self.view.addGestureRecognizer(tapGesture)
    }
    
//    func setupImageClickListener() {
//        let tapGestureRecognizer
//            = UITapGestureRecognizer(target:self, action:#selector(ViewController.selectImageFromPhotoLibrary(_:)));
////        photoImageView.isUserInteractionEnabled = true
////        photoImageView.addGestureRecognizer(tapGestureRecognizer)
//    }

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if info[.originalImage] as? UIImage != nil{
            let selectedImage = info[.originalImage] as! UIImage
            //UserDefaults.standard.set(selectedImage.jpegData(compressionQuality: 0.1), forKey: "userImage")
            photoImageView.image = selectedImage
            picker.dismiss(animated: true, completion: nil)

        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
}

