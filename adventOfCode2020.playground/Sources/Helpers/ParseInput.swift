import Foundation

public class ResourceHelper {
    public static func getInput(from resourceName: String) -> String {
        guard let inputURL = Bundle.main.url(forResource: resourceName, withExtension: ""),
              let contents = FileManager.default.contents(atPath: inputURL.path),
              let str = String(data: contents, encoding: String.Encoding.utf8) else {
            return ""
        }
        
        return str
    }
}
