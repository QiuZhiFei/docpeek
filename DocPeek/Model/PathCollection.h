#import <Foundation/Foundation.h>
#import "Path.h"

@interface PathCollection : NSObject 
{
@private
    NSMutableArray * paths;
    NSString * dbpath;
}


@property (nonatomic) NSInteger count;

- (Path *) getByIndex: (NSInteger) index;

- (void) addPath: (Path *) path;

- (void) removeAt: (NSInteger) index;

- (void) updateNameAt: (NSInteger) index with: (NSString *) name;
@end
