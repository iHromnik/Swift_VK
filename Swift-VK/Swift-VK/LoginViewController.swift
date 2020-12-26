//
//  ViewController.swift
//  Swift-VK
//
//  Created by HappyRoman on 23/12/2020.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
   
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
              let checkResult = checkUserData()
              if !checkResult {
                  showLoginError()
              }
              return checkResult
          }
          
          func checkUserData() -> Bool {
              guard let login = loginTextView.text,
                  let password = passwordTextView.text else { return false }
              
              if login == "admin" && password == "123" {
                  return true
              } else {
                  return false
              }
          }
          
          func showLoginError() {
              let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
              let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
              alter.addAction(action)
              present(alter, animated: true, completion: nil)
          }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowe(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            }
            
           @objc func keyboardWillShowe(notification: Notification){
                guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
                let insest = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.size.height, right: 0)
                scrollView.contentInset = insest
            }
            
           @objc func keyboardWillHide(notification: Notification){
                let insest = UIEdgeInsets.zero
                scrollView.contentInset = insest
            }


    @IBAction func signInButton(_ sender: UIButton) {
    }
}

