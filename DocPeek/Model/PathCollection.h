#import <Foundation/Foundation.h>
#import "Path.h"

@interface PathCollection : NSObject 
{
@private
    NSMutableArray * paths;
}


@property (nonatomic) NSInteger count;

- (Path *) getByIndex: (NSInteger) index;

- (void) addPath: (Path *) path;

- (void) removeAt: (NSInteger) index;

@end
