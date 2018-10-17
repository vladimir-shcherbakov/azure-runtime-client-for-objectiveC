/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "Operations/Arrays1.h"

/**
 * The interface for AutoRestSwaggerBATArrayService class.
 */
@protocol AutoRestSwaggerBATArrayServiceProtocol

    /**
     * Gets the ArraysProtocol object to access its operations.
     * @return the Arrays object.
     */
    - (id<ArraysProtocol>) arrays;

@end

@interface AutoRestSwaggerBATArrayService : NSObject <AutoRestSwaggerBATArrayServiceProtocol>

    /**
        The default base URL. http://localhost:3000
    */
    @property (readonly) NSString* DEFAULT_BASE_URL;

    + (id<AutoRestSwaggerBATArrayServiceProtocol>) create;

@end
