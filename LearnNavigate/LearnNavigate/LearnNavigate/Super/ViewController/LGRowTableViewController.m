//
//  LGAccountCenterTableViewController.m
//  outbusiness
//
//  Created by 唐开福 on 16/12/14.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import "LGRowTableViewController.h"
#import "LGRowTableViewCell.h"
#import "LGNewOrderViewController.h"
@interface LGRowTableViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation LGRowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRowData];
    self.dataArray = [self setupRowData];
    [self.tableView registerClass:[LGRowTableViewCell class] forCellReuseIdentifier:[LGRowTableViewCell lg_name]];
    [self.tableView reloadData];
}

- (NSArray *)setupRowData {
//    LGRowModel *row0 =  [LGRowModel creatRowWithtopSpcaeHeight:0 rowHeight:50 title:@"营业统计" rowType:LGRowTableViewCellTypeArrow targetVC:[LGNewOrderViewController class]];
//    LGRowModel *row1 =  [LGRowModel creatRowWithtopSpcaeHeight:0 rowHeight:50 title:@"财务信息" rowType:LGRowTableViewCellTypeArrow targetVC:nil];
//    LGRowModel *row2 =  [LGRowModel creatRowWithtopSpcaeHeight:0 rowHeight:50 title:@"退款申请" rowType:LGRowTableViewCellTypeArrow targetVC:nil];
//    LGRowModel *row3 =  [LGRowModel creatRowWithtopSpcaeHeight:10 rowHeight:60 title:@"历史订单" rowType:LGRowTableViewCellTypeArrow targetVC:nil];
//    LGRowModel *row4 =  [LGRowModel creatRowWithtopSpcaeHeight:0 rowHeight:50 title:@"消息通知" rowType:LGRowTableViewCellTypeArrow targetVC:nil];
//    
//    return @[row0, row1, row2, row3, row4];
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (LGUITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LGRowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LGRowTableViewCell lg_name] forIndexPath:indexPath];
    cell.dataModel = self.dataArray[indexPath.row];
    cell.bottomLineView.hidden = NO;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LGRowModel *rowModel = self.dataArray[indexPath.row];
    return rowModel.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LGRowModel *rowModel = self.dataArray[indexPath.row];
    UIViewController *ViewController = (UIViewController *)[[rowModel.targetViewController alloc] init];
    [self.navigationController pushViewController:ViewController animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
