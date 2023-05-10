//
//  AIChatAPI.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/26/23.
//
// private static let apiKey = "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" //
import Foundation

class AIChatAPI {
    private static let apiKey = "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"
    private static let apiUrl = "https://api.openai.com/v1/completions"
   // "https://api.openai.com/v1/engines/davinci/completions"
    
    static func getAIResponse(input: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            return
        }
        
        let prompt = "you are a super sweet girl, your name is Sally, now pretend to be my girlfriend, and make be feel good about myself while talking to me, be lovely and concise when talking, just like how normal people chat in text, and remember to add background script when you talk to me, make me feel like I am in the same room with you, I want the to feel like I am talking to a real person face to face, make sure to limit your answer to less than 15 words, if you have to say more, say it in a new line"
       
       // "User: \(input)\nAI:"
        let parameters: [String: Any] = [
            "model": "text-davinci-003",
            "prompt": prompt,
            "max_tokens": 100
            
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Print the raw response data for debugging
            if let rawResponse = String(data: data, encoding: .utf8) {
                // print("Raw response: \(rawResponse)")
            }
           // After receiving the AI response
           do {
               let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
               if var message = aiResponse.choices.first?.text {
                   // Trim leading and trailing whitespace characters
                   message = message.trimmingCharacters(in: .whitespacesAndNewlines)
                   
                   // If the message starts with a period, remove it
                   if message.hasPrefix(".") {
                       message = String(message.dropFirst())
                   }
                   
                   // Trim any remaining leading and trailing whitespace characters
                   message = message.trimmingCharacters(in: .whitespacesAndNewlines)
                   
                   DispatchQueue.main.async {
                       completion(message)
                   }
               }
           } catch {
               print("Error decoding response: \(error)")
           }
           
        }.resume()
    }
    
    private struct AIResponse: Decodable {
        let choices: [AIChoice]
    }
    
    private struct AIChoice: Decodable {
        let text: String
    }
}
