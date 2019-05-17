//
//  Sort.m
//  DemoPractice
//
//  Created by Leon on 2019/3/28.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "Sort.h"

@interface Sort ()

@end

@implementation Sort

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =Color_White;
    
    
    
//    冒泡
//    [self bubbleSortWithArray:[@[@"1",@"100",@"2",@"51",@"7",@"3",@"5",@"32"] mutableCopy]];
//
////    快排
//    NSMutableArray * arr = @[@16,@1,@2,@9,@7,@12,@5,@3,@8,@13,@10].mutableCopy;
//    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count-1];
//    NSLog(@"%@",arr);
//
//
////    插入
//    [self insertSortWithArray:arr];
//    NSLog(@"%@",arr);
    
//    最小公约数
//    gcd(10, 5);
    
//    找出数组中的重复的
    
}


/**
     1. 冒泡排序算法(Bubble Sort)
     相邻元素进行比较，按照升序或者降序，交换两个相邻元素的位置 是一种“稳定排序算法”
     1.2算法步骤：
     比较相邻的元素。如果第一个比第二个大，就交换他们两个。
     对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
     针对所有的元素重复以上的步骤，除了最后一个。
     持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
 */
- (void)bubbleSortWithArray:(NSMutableArray *)array {
    
    for (int i = 0; i < array.count - 1; i++) {
        //外层for循环控制循环次数
        for (int j = 0; j < array.count - 1 - i; j++) {
            //内层for循环控制交换次数
            if ([array[j] integerValue] > [array[j + 1] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    NSLog(@"%@",array);
}


/**
     快速排序(Quick Sort) 的基本思想是：
     通过一趟排序将待排序的记录分割成独立的两部分，其中一部分记录的关键字均比另一部分记录的关键字小，则可分别对这两部分记录继续进行排序，以达到整个序列有序的目的。
     排序思路：
     数组选第一个数，把比数小的放到数的左边，比数大的放到右边，结束后对左右两边的数组作重复处理即可。
     快速排序使用分治法（Divide and conquer）策略来把一个串行（list）分为两个子串行（sub-lists）。
     2.2 算法步骤
     从数列中挑出一个元素，称为 “基准”（pivot）;
     重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；
     递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序；
     递归的最底部情形，是数列的大小是零或一，也就是永远都已经被排序好了。虽然一直递归下去，但是这个算法总会退出，因为在每次的迭代（iteration）中，它至少会把一个元素摆到它最后的位置去。
 */
- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex
{
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];
        
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
        
    }
    
    //将基准数放到正确位置
    array[i] = @(key);
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}

void quick_sort(int s[],int l,int r){
    if (l < r) {
        //Swap(s[l], s[(l + r) / 2]); //将中间的这个数和第一个数交换 参见注1
        int i = l, j = r, x = s[l];
        while (i < j) {
            while(i < j && s[j] >= x) {// 从右向左找第一个小于x的数
                j--;
            }
            if(i < j) {
                s[i] = s[j];
            }
            
            while(i < j && s[i] < x) {// 从左向右找第一个大于等于x的数
                i++;
            }
            if(i < j) {
                s[j] = s[i];
            }
        }
        s[i] = x;
        quick_sort(s, l, i - 1); // 递归调用
        quick_sort(s, i + 1, r);
    }
}

/**
     3.1 直接选择排序
 
     首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
     再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
     重复第二步，直到所有元素均排序完毕。
 */
- (void)selectSortWithArray:(NSMutableArray *)array {
    for (int i = 0; i < array.count; i++) {
        for (int j = i + 1; j < array.count; j++) {
            if (array[i] > array[j]) {
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
}

void selectSort(int *arr, int length) {
    for (int i = 0; i < length - 1; i++) { //趟数
        for (int j = i + 1; j < length; j++) { //比较次数
            if (arr[i] > arr[j]) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
}

/**
 插入排序(insert sort)
 4.1 网上文字理解
 插入排序的代码实现虽然没有冒泡排序和选择排序那么简单粗暴，但它的原理应该是最容易理解的了，因为只要打过扑克牌的人都应该能够秒懂。插入排序是一种最简单直观的排序算法，它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
 插入排序和冒泡排序一样，也有一种优化算法，叫做拆半插入。
 4.2 算法步骤
 
 将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列。
 从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置。（如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面）
 */
- (void)insertSortWithArray:(NSMutableArray *)array {
    NSInteger j;
    for (NSInteger i = 1; i < array.count; i++) {
        //取出每一个待插入的数据，从array[1]开始查找
        NSInteger temp = [array[i] integerValue];
        
        for (j = i - 1; j >= 0 && temp < [array[j] integerValue]; j--) {
            //如果之前的数比temp大，就将这个数往后移动一个位置，留出空来让temp插入，和整理扑克牌类似
            array[j + 1] = array[j];
            array[j] = [NSNumber numberWithInteger:temp];
        }
    }
}


//求最大公约数
int gcd(int a, int b) {
    
    int temp = 0;
    
    if (a < b) {
        
        temp = a;
        
        a = b;
        
        b = temp;
        
    }
    
    while (b != 0) {
        
        temp = a % b;
        
        a = b;
        
        b = temp;
        
    }
    
    return a;
}


//取出数组中相同的
bool duplicate(int num[],int length,int *duplicate){
    for (int i = 0 ; i < length; i++) {
        while (num[i] != i) {
            if (num[i] == num[num[i]]) {
                *duplicate = num[i];
                return true;
            }
            
            int temp = num[i];
            num[i] = num[temp];
            num[temp] = temp;
        }
    }
    return false;
}

@end
