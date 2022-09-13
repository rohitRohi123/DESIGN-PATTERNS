//
//  ViewController.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 03/09/22.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func onClickedMVC(_ sender: Any) {
        let moviewlistVc = MoviewListVc_MVC()
        
        self.navigationController?.pushViewController(moviewlistVc, animated: true)
    }
    
    @IBAction func onClickedMVVM(_ sender: Any) {
        let movieListVc = MovieListVcMVVM()
        
        self.navigationController?.pushViewController(movieListVc, animated: true)
    }
    
    @IBAction func onClickedVIPER(_ sender: Any) {
        let movieListVc = MoviewListVcVIPER()
        
        self.navigationController?.pushViewController(movieListVc, animated: true)
    }
    
}

