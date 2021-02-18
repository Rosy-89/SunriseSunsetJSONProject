//
//  ViewController.swift
//  SunriseSunsetJSONProject
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sunriseLabel: UILabel!
    
    @IBOutlet weak var sunNoonLabel: UILabel!
    
    @IBOutlet weak var sunsetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        let url = "https://api.sunrise-sunset.org/json?lat=51.509865&lng=-0.118092&date=today"
        getData(from: url)
    }
    
    func getData(from url: String)
    {
        let dataTask = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(SunRiseModel.self, from: data!)
                
                let jsonSunrise = response.results.sunrise
                let jsonSunset = response.results.sunset
                let jsonSolar_noon = response.results.solar_noon
                
                DispatchQueue.main.async {
                    
                    self.sunriseLabel.text = jsonSunrise
                    self.sunsetLabel.text = jsonSunset
                    self.sunNoonLabel.text = jsonSolar_noon
                }
            }
            catch{
                print("\(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}

