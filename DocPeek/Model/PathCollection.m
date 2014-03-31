    #import "PathCollection.h"
#import "FMDatabase.h"

@implementation PathCollection

- (PathCollection *) init {
    self = [super init];
    if (self)
    {
        paths = [NSMutableArray new];
        dbpath = [NSString stringWithFormat:@"%@%@",[[NSBundle mainBundle] bundlePath], @"/Contents/Resources/docpeek.db"];
    }
    
    FMDatabase * db = [FMDatabase databaseWithPath: dbpath];
    if (![db open])
    {
        NSLog(@"error opening db");
        return self;
    }
    
    FMResultSet * resultSet = [db executeQuery: @"select rowid, path, name from paths order by rowid asc"];
    
    while ([resultSet next]){
        Path * path = [Path new];
        [path setPathId:[resultSet intForColumn:@"rowid"]];
        [path setName:[resultSet stringForColumn:@"name"]];
        [path setUrl:[NSURL URLWithString:[resultSet stringForColumn:@"path"]]];
        
        [paths addObject:path];
        
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
    FMDatabase * db = [FMDatabase databaseWithPath:dbpath];
    if (![db open])
    {
        NSLog(@"error opening db");
        return;
    }
    NSDictionary * paramDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[[path url] absoluteString],@"path", [path name], @"name", nil];
    [db executeUpdate: @"insert into paths (path, name) values (:path, :name)" withParameterDictionary: paramDictionary];
    
    FMResultSet * resultSet = [db executeQuery:@"select last_insert_rowid()"];
    [resultSet next];
    
    NSInteger lastRowId = [resultSet intForColumnIndex:0];
    
    [path setPathId:lastRowId];
    
}

- (void) removeAt: (NSInteger) index
{
    [paths removeObjectAtIndex:index];
}

- (void) updateNameAt: (NSInteger) index with: (NSString *) name
{
    FMDatabase * db = [FMDatabase databaseWithPath:dbpath];
    if (![db open])
    {
        NSLog(@"error opening db");
        return;
    }
    Path * path = [self getByIndex: index];
    [path setName:name];
    
    NSDictionary * paramDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%ld",(long)[path pathId]],@"id", [path name], @"name", nil];
    [db executeUpdate: @"update paths set name = :name where oid = :id" withParameterDictionary: paramDictionary];
    
    
}

@end
