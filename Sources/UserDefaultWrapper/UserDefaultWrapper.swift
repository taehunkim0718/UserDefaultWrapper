import Foundation

@propertyWrapper
public struct UserDefault<Value> {
    
    private let key: String
    
    private let storage: UserDefaults
    
    private let defaultValue: Value?
    
    public var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value ?? defaultValue }
        set { storage.setValue(newValue, forKey: key) }
    }
    
    public init(key: String, storage: UserDefaults = .standard, defaultValue: Value? = nil) {
        self.key = key
        self.storage = storage
        self.defaultValue = defaultValue
    }
}
