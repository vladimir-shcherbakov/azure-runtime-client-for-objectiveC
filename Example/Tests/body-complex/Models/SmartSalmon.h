/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
*/

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "Salmon.h"

/**
 * The SmartSalmon model.
*/
    //JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.PROPERTY, property = "fishtype")
    //JsonTypeName("smart_salmon")
@interface SmartSalmon : Salmon <Codable>

    /**
     * Unmatched properties from the message are deserialized this collection.
    */
    // json ""
    @property NSDictionary<NSString*, NSObject*>* additionalProperties;

    /**
     * The collegeDegree property.
    */
    // json "college_degree"
    @property NSString* collegeDegree;


@end
