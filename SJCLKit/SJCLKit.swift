import JavaScriptCore

public class SJCL {
    let encrypt: JSValue
    let decrypt: JSValue
    
    public init() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let jsPath = bundle.pathForResource("sjcl", ofType: "js")!
        let text = try! String(contentsOfFile: jsPath)
        
        let js = JSContext()
        js.evaluateScript(text)
        
        js.evaluateScript("var encrypt = function(pw, data) { return sjcl.encrypt(pw, data); }")
        js.evaluateScript("var decrypt = function(pw, data) { return sjcl.decrypt(pw, data); }")
        
        encrypt = js.objectForKeyedSubscript("encrypt")
        decrypt = js.objectForKeyedSubscript("decrypt")
    }
    
    public func encrypt(password: String, data: String)-> String {
        return self.encrypt.callWithArguments([password, data]).toString()
    }
    
    public func decrypt(password: String, data: String) -> String {
        return self.decrypt.callWithArguments([password, data]).toString()
    }
}
