//
//  ViewController.m
//  JSDropMenuViewDemo
//
//  Created by jsfu on 16/1/21.
//  Copyright © 2016年 js. All rights reserved.
//

#import "ViewController.h"
#import "JSDropmenuView.h"
@interface ViewController ()<JSDropmenuViewDelegate>
@property(nonatomic,strong) NSArray *menuArray;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
    self.menuArray = @[@{@"imageName":@"contact_white", @"title":@"联系客服"},@{@"imageName":@"share_white", @"title":@"分    享"}];
    UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStyleDone target:self action:@selector(menuTap)];
    self.navigationItem.rightBarButtonItem = menuBarButtonItem;
}

- (void)menuTap{
    JSDropmenuView *dropmenuView = [[JSDropmenuView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-150, 64-12, 140, 44*2+12)];
    dropmenuView.delegate = self;
    [dropmenuView showViewInView:self.navigationController.view];
}

#pragma mark ----------------JSDropmenuViewDelegate
- (NSArray *)dropmenuDataSource {
    return self.menuArray;
}

- (void)dropmenuView:(JSDropmenuView *)dropmenuView didSelectedRow:(NSInteger)index {
    if(index>=self.menuArray.count){
        return;
    }
    NSDictionary *itemDic = [self.menuArray objectAtIndex:index];
    [NSString stringWithFormat:@"选中-------%@",[itemDic objectForKey:@"title"]];
}
@end
