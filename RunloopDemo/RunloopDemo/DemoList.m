//
//  DemoList.m
//  RunloopDemo
//
//  Created by KH on 16/6/15.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "DemoList.h"

@interface DemoList()
@property (strong, nonatomic) NSArray <NSDictionary <NSString *,id>*>* list;

@end

@implementation DemoList
-(NSArray <NSDictionary <NSString *,id>*>*)list
{
    if (!_list)
    {
        NSMutableArray *tempArr = [NSMutableArray array];
        
        [tempArr addObject:@{@"controller":@"RunloopDemo0",
                             @"des":@"最简单demo"}];
        [tempArr addObject:@{@"controller":@"RunloopDemo1",
                             @"des":@"线程关联"}];
        [tempArr addObject:@{@"controller":@"RunloopDemo2",
                             @"des":@"定时器"}];
        
        _list = [tempArr copy];
    }
    return _list;
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.list[indexPath.row][@"des"];
    return cell;
}

-(void )tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller = [[NSClassFromString(self.list[indexPath.row][@"controller"]) alloc] init];
    controller.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
