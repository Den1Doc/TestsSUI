//
//  FileManagerBootcamp.swift
//  TestsSUI
//
//  Created by Денис Мишин on 16.04.2023.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    
    init() {
        createFolderiIfNeede()
    }
    
    func createFolderiIfNeede() {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("error \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path else {
            return
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Yra")
        } catch let error {
            print("Error \(error)")
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard let data = image.jpegData(compressionQuality: 1.0),
              let path = getPathForImage(name: name) else {
            return "Error"
        }

        do {
            try data.write(to: path)
            return "Ура!"
        } catch let error {
            return "Error \(error)"
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            print("Error")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }

    func deleteImage(name: String) -> String {
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            return "Error"
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Ура удаление"
        } catch let error {
            return "Error \(error)"
        }
        
        
    }
    
    func getPathForImage(name: String) -> URL? {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?
            .appendingPathComponent(folderName)
            .appendingPathComponent("\(name).jpg") else {
            print("Error")
            return nil
        }
        return path
    }
    
}

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var infoMessages: String = ""
    let imageName: String = "снимок"
    let manager = LocalFileManager.instance
    
    
    init() {
        getImageFromAssets()
//        getImageFromFileManager()
    }

    func getImageFromAssets() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else {return}
       infoMessages = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
       infoMessages = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
    
}



struct FileManagerBootcamp: View {
    @StateObject var vm = FileManagerViewModel()
    var body: some View {
        
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
                
                HStack {
                    Button {
                        vm.saveImage()
                    } label: {
                        Text("Save to FM")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue.cornerRadius(10))
                    }
                    
                    Button {
                        vm.deleteImage()
                    } label: {
                        Text("Delete from FM")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.red.cornerRadius(10))
                    }
                }
                
                
                Text(vm.infoMessages)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                
                Spacer()
            }
            .navigationTitle("File Manager")
        }
        
    }
}

struct FileManagerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerBootcamp()
    }
}
