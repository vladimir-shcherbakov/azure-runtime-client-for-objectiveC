/**
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
*/

#import <AzureClientRuntime/AzureClientRuntime.h>
#import "Fish.h"

/**
 * The Fish model.
*/
    //JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.PROPERTY, property = "fishtype")
    //JsonTypeName("Fish")
    // SubTypes: name = "salmon", value = Salmon
    // SubTypes: name = "shark", value = Shark
@interface Fish : NSObject <Codable>

    /**
     * The species property.
    */
    // json "species"
    @property NSString* species;

    /**
     * The length property.
    */
    // json "length", required = true
    @property AZDouble* length;

    /**
     * The siblings property.
    */
    // json "siblings"
    @property NSArray<Fish*>* siblings;

    /**
    * Creates an instance of Fish class.
    * @param length the length value.
    */
    - (id) initLength: (AZDouble*) length;


@end