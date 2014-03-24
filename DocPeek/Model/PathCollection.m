#import "PathCollection.h"

@implementation PathCollection

- (PathCollection *) init {
    self = [super init];
    if (self)
    {
        paths = [NSMutableArray new];
    }
    return self;
}

- (NSInteger) count
{
    return [paths count];
}

- (Path *) getByIndex:(NSInteger)index
{
    return paths[index];
}

- (void) addPath:(Path *)path
{
    [paths addObject:path];
}

- (void) removeAt: (NSInteger) index;
{
    [paths removeObjectAtIndex:index];
}

@end
