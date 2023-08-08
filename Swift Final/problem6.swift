import UIKit

private var myViewController: LoginViewController = {
  // Instantiate a new LoginViewController from the 'myStoryboard' storyboard.
  guard
    let myViewController =  // missing 'let'
      UIStoryboard.myStoryboard.instantiateViewController(
        withIdentifier: LoginViewController.storyboardIdentifier) as? LoginViewController
  else {
    fatalError("Wrong View Controller")
  }

  // Assign a closure to the 'doLogin' property of the LoginViewController instance.
  myViewController.doLogin = { [weak self] in
    // Call the 'modifyView()' method on 'self' when the 'doLogin' closure is executed.
    // Using '[weak self]' to avoid potential retain cycles.
    self?.modifyView()
  }

  return myViewController
}()
