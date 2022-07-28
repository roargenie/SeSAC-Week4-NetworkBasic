
import UIKit

class WebkitViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Webkit", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    

}
