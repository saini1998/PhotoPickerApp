//
//  PhotoPicker.swift
//  Photo Picker
//
//  Created by Aaryaman Saini on 29/07/21.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable{
    
    @Binding var avatarImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker){
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage{
                guard let data = image.jpegData(compressionQuality: 0.5), let compressedImage = UIImage(data: data) else {
                    return
                }
                photoPicker.avatarImage = compressedImage
            }else{
                
            }
            picker.dismiss(animated: true)
        }
    }
    
}


