/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

#import "Operations/Files.h"

/**
 * The interface for AutoRestSwaggerBATFileService class.
 */
@protocol AutoRestSwaggerBATFileServiceProtocol

    /**
     * Gets the FilesProtocol object to access its operations.
     * @return the Files object.
     */
    - (id<FilesProtocol>) files;

@end

@interface AutoRestSwaggerBATFileService : NSObject <AutoRestSwaggerBATFileServiceProtocol>

    /**
        The default base URL. http://localhost:3000
    */
    @property (readonly) NSString* DEFAULT_BASE_URL;

    + (id<AutoRestSwaggerBATFileServiceProtocol>) create;

@end