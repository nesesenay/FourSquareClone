import UIKit

// var globalName = ""
// var globalType = ""
// var globalAtmosphere = ""

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var PlaceNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeAtmosphereText: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePlaceImage))
        placeImageView.addGestureRecognizer(gestureRecognizer)
    }
    

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if PlaceNameText.text != "" && placeTypeText.text != "" && placeAtmosphereText.text != "" {
            
            if let chosenImaage = placeImageView.image {
    
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = PlaceNameText.text!
                placeModel.placeType = placeTypeText.text!
                placeModel.placeAtmosphere = placeAtmosphereText.text!
                placeModel.placeImage = chosenImaage
                
            }
            
            performSegue(withIdentifier: "toMapVC", sender: nil)
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Place Name/Type/Atmosphere??", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    @objc func choosePlaceImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}

