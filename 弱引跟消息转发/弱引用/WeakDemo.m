//
//  WeakDemo.m
//  弱引用
//
//  Created by KH on 16/7/10.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "WeakDemo.h"

@interface WeakDemo ()
@property (strong, nonatomic) id obj;
@end

@implementation WeakDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMapTable *mapTable = nil;
    NSHashTable *hashTable = nil;
    NSPointerArray *pointArray = nil;
    
    UILabel *label = [UILabel new];
    self.obj = label;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:label forKey:@"label"];
    
    id obj = dict[@"label"];
    NSLog(@"%p",&label);
    NSLog(@"%p",&obj);
    NSLog(@"%p",&_obj);
    
    label = nil;
    
    NSLog(@"%@",label);
    NSLog(@"%@",obj);
    NSLog(@"%@",self.obj);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
