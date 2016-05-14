//
//  HomeViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 25-02-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var Imagen = UIImageView()

    @IBOutlet var barra: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.barra.title = "Bienvenido "+Usuario.ObtenerUsuario()+"!"
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ing.jpg")!)
       /*
        self.Imagen.image = UIImage(named: "ing.jpg")
        var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = Imagen.bounds
        self.Imagen.addSubview(blurView)
        self.view.addSubview(Imagen)
        self.view.backgroundColor = UIColor(patternImage: Imagen.image!)*/
        
      /*  var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.init(rawValue: 2)!)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation
        self.view.addSubview(blurEffectView)*/
        
    /*    var imageToBlur = CIImage(image: UIImage(named: "ing.jpg")!)
        var blurfilter = CIFilter(name: "CIGaussianBlur")
        blurfilter!.setValue(imageToBlur, forKey: "inputImage")
        var resultImage = blurfilter!.valueForKey("outputImage") as? CIImage
        var blurredImage = UIImage(CIImage: resultImage!)
        self.Imagen.image = blurredImage
        self.view.backgroundColor = UIColor(patternImage: Imagen.image!)*/
       
        
        
      //  self.Imagen.image = UIImage(named: "ing.jpg")
       // var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.init(rawValue: self)!)
        
    /*  //  var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight] // for supporting device rotation*/
        
       /* let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.5
        blurEffectView.frame = self.Imagen.bounds
        self.Imagen.addSubview(blurEffectView)
        self.view.backgroundColor = UIColor(patternImage: Imagen.image!)*/
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
