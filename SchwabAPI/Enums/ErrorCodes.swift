
import Foundation

public enum ErrorCodes: Error
{

    case decodingError
    case invalidResponse
    case networkError(Error)
    case notAuthenticated
    case rateLimitExceeded

}
