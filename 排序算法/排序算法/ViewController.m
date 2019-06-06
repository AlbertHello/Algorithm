//
//  ViewController.m
//  排序算法
//
//  Created by ZZ on 2017/6/28.
//  Copyright © 2017年 ZZ. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    /**
     常见算法时间复杂度：
     O(1): 表示算法的运行时间为常量
     O(n): 表示该算法是线性算法
     O(㏒2n): 二分查找算法
     O(n2): 对数组进行排序的各种简单算法，例如直接插入排序的算法。
     O(n3): 做两个n阶矩阵的乘法运算
     O(2n): 求具有n个元素集合的所有子集的算法
     O(n!): 求具有N个元素的全排列的算法
     优<---------------------------<劣
     O(1)<O(㏒2n)<O(n)<O(n2)<O(2n)
     时间复杂度按数量级递增排列依次为：常数阶O(1)、对数阶O(log2n)、线性阶O(n)、线性对数阶O(nlog2n)、平方阶O(n2)、立方阶O(n3)、……k次方阶O(nk)、指数阶O(2n)。
     */
    
//    [self Bubble_Sort];
//    [self Selection_sort];
//    [self quickSort];
//    [self BinarySearch];
    [self inSort];
    
    
    
    
    
    
}

//写一个c函数专门打印数组的
void printArray(int array[],int count,int flag)
{
    if (flag==0) {
        printf("排序前：");
        for (int i=0; i<count; i++) {
            printf("%d  ",array[i]);
        }
        printf("\n");
    }else{
        printf("排序后：");
        for (int i=0; i<count; i++) {
            printf("%d  ",array[i]);
        }
    }
}
//冒泡排序
//对以下数据进行降序排序 24, 17, 85, 13, 9, 54, 76, 45, 5, 63
-(void)Bubble_Sort
{
    /**
     算法原理：
     冒泡排序算法的运作如下：（从后往前）
     1、比较相邻的元素。如果第一个比第二个大，就交换他们两个。
     2、对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。在这一点，最后的元素应该会是最大的数。
     3、针对所有的元素重复以上的步骤，除了最后一个。
     4、持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
     
     冒泡排序就是把小的元素往前调或者把大的元素往后调。比较是相邻的两个元素比较，交换也发生在这两个元素之间。所以，如果两个元素相等，我想你是不会再无聊地把他们俩交换一下的；如果两个相等的元素没有相邻，那么即使通过前面的两两交换把两个相邻起来，这时候也不会交换，所以相同元素的前后顺序并没有改变，所以冒泡排序是一种稳定排序算法。
     */
    
    int array[10] = {24, 17, 85, 13, 9, 54, 76, 45, 5, 63};
    int num = sizeof(array)/sizeof(int);
    printArray(array, num,0);
    //算法
    for(int i = 0; i < num-1; i++) {
        for(int j = 0; j < num - 1 - i; j++) {
            if(array[j] < array[j+1]) {
                int tmp = array[j];
                array[j] = array[j+1];
                array[j+1] = tmp;
            }
        }
    }
    printArray(array, num,1);
    
    /**
     若文件的初始状态是正序的，一趟扫描即可完成排序。所需的关键字比较次数C和记录移动次数M均达到最小值
     C=n-1; M=0.
     所以，冒泡排序最好的时间复杂度为O(n)。
     
     若初始文件是反序的，需要进行n-1趟排序。每趟排序要进行n-i次关键字的比较(1≤i≤n-1)，且每次比较都必须移动记录三次来达到交换记录位置。在这种情况下，比较和移动次数均达到最大值：
     C=n*(n-1)/2=O(n^2); M=3n*(n-1)/2=O(n^2).
     冒泡排序的最坏时间复杂度为O(n^2).
     
     综上，因此冒泡排序总的平均时间复杂度为O(n^2).
     */
    
}

//选择排序
//对以下一组数据进行升序排序（选择排序）。“86, 37, 56, 29, 92, 73, 15, 63, 30, 8”
-(void)Selection_sort{
    /**
     选择排序的基本思想是：每一趟在n-i+1（i=1，2，…n-1）个记录中选取关键字最小的记录作为有序序列中第i个记录。基于此思想的算法主要有简单选择排序、树型选择排序和堆排序.
     简单选择排序的基本思想：第1趟，在待排序记录r[1]~r[n]中选出最小的记录，将它与r[1]交换；第2趟，在待排序记录r[2]~r[n]中选出最小的记录，将它与r[2]交换；以此类推，第i趟在待排序记录r[i]~r[n]中选出最小的记录，将它与r[i]交换，使有序序列不断增长直到全部排序完毕。
     */
    int numArr[10] = {86, 37, 56, 29, 92, 73, 15, 63, 30, 8};
    int n=sizeof(numArr)/sizeof(int);
    printArray(numArr, n, 0);
    int i, j, index;
    for(i = 0; i < n - 1; i++) {
        index = i;
        for(j = i + 1; j < n; j++) {
            if(numArr[index] > numArr[j]) {
                index = j;//在一趟的俩数比较中选出最小的那个数对应的下标。
            }
        }
        if(index != i) {//若是一趟比较下来，index的值变了表示找到了一个更小的值，那么就替换。这就是简单选择排序的思想。
            int temp = numArr[i];
            numArr[i] = numArr[index];
            numArr[index] = temp;
        }
    }
    printArray(numArr, n, 1);
    /**
     简单选择排序过程中需要进行的比较次数与初始状态下待排序的记录序列的排列情况无关。当i=1时，需进行n-1次比较；当i=2时，需进行n-2次比较；依次类推，共需要进行的比较次数是∑ =(n-1)+(n-2)+…+2+1=n(n-1)/2，即进行比较操作的时间复杂度为O(n2)。
     */
}

//插入排序
-(void)inSort
{
    int number[10]={86, 37, 56, 29, 92, 73, 15, 63, 30, 8};
    int len=10;
    int i, j, k, tmp;
    for(j = 1; j < len; j++) {
        tmp = number[j];
        i = j - 1;
        while(tmp < number[i]) {
            number[i+1] = number[i];
            i--;
            if(i == -1)
                break;
        }
        number[i+1] = tmp;
        
        printf("第 %d 次排序：", j);
        for(k = 0; k < len; k++)
            printf("%d ", number[k]);
        printf("\n");   
    }
}






//快速排序
-(void)quickSort{
    /**
     快速排序是当遇到较大数据时,排序快,高效的方法.
     该方法的基本思想是：
     
     1．先从数列中取出一个数作为基准数。
     
     2．分区过程，将比这个数大的数全放到它的右边，小于或等于它的数全放到它的左边。
     
     3．再对左右区间重复第二步，直到各区间只有一个数。
     简单地理解就是,找一个基准数(待排序的任意数,一般都是选定首元素),把比小于等于基准数的元素放到基准数的左边,把大于基准数的元素放在基准数的右边.排完之后,在把基准数的左边和右边各看成一个整体,  左边:继续选择基准数把小于等于基准数的元素放到基准数的左边,把大于基准数的元素放在基准数的右边,右边也是一样..直到各区间只有一个数位置。
     快速排序之所比较快，因为相比冒泡排序，每次交换是跳跃式的。每次排序的时候设置一个基准点，将小于等于基准点的数全部放到基准点的左边，将大于等于基准点的数全部放到基准点的右边。这样在每次交换的时候就不会像冒泡排序一样每次只能在相邻的数之间进行交换，交换的距离就大的多了。因此总的比较和交换次数就少了，速度自然就提高了。当然在最坏的情况下，仍可能是相邻的两个数进行了交换。因此快速排序的最差时间复杂度和冒泡排序是一样的都是O(n2)，它的平均时间复杂度为O(nlogn)。
     */
    int a[10]={86, 37, 56, 29, 92, 73, 73, 63, 30, 8};
    int num=sizeof(a)/sizeof(int);
    printArray(a, num, 0);
//    quicksort1(a, 0, num-1);
    quicksort2(a, 0, num-1);
    printArray(a, num, 1);
}
//快速排序1
void quicksort1(int a[] ,int left, int right){
    
    int i, j, t, temp;
    if(left > right){   //开始位置坐标大于结束位置坐标时,直接return,结束下面的操作
        return;
    }
    
    temp = a[left]; //temp中存的就是基准数(基准数是随机的,但一般都是第一个元素)
    i = left;
    j = right;
    while(i != j)
    {
        
        //顺序很重要，要先从右边开始找
        while(a[j] >= temp && i<j){
            j--;
        }
        
        //再找左边的
        while(a[i] <= temp && i<j){
            i++;
        }
        
        //交换两个数在数组中的位置
        if(i < j){
            t = a[i];
            a[i] = a[j];
            a[j] = t;
        }
    }
    //此时i = j,最终将基准数归位
    a[left] = a[i];
    a[i] = temp;
    
    //递归调用
    quicksort1( a,left, i-1);//继续处理左边的，这里是一个递归的过程
    quicksort1( a,i+1, right);//继续处理右边的 ，这里是一个递归的过程
    
}
//快速排序2
void quicksort2(int *a, int left, int right) {
    
    if(left >= right) {
        return ;
    }

    int i = left;

    int j = right;

    int key = a[left];//取基准数

    while (i < j)
    {
        
        while (i < j && key <= a[j]) {//先从右边比较，大的方右边，小的放左边
            j--;
        }
        a[i] = a[j];
        while (i < j && key >= a[i]) {
            i++;
        }
        a[j] = a[i];
        
    }

    a[i] = key;
    quicksort2(a, left, i-1);
    quicksort2(a, i+1, right);
}

/**
 二分插入排序是稳定的与二分查找的复杂度相同；
 最好的情况是当插入的位置刚好是二分位置 所用时间为O(log₂n);
 最坏的情况是当插入的位置不在二分位置 所需比较次数为O(n)，无限逼近线性查找的复杂度。
 平均时间O(n^2)
 折半插入排序适合记录数较多的场景，与直接插入排序相比，折半插入排序在寻找插入位置上面所花的时间大大减少，但是折半插入排序在记录移动次数方面和直接插入排序是一样的，所以其时间复杂度为O(n^2)。
 
 算法思想简单描述：
 在插入第i个元素时，对前面的0～i-1元素进行折半，先跟他们
 中间的那个元素比，如果小，则对前半再进行折半，否则对后半
 进行折半，直到left>right，然后再把第i个元素前1位与目标位置之间
 的所有元素后移，再把第i个元素放在目标位置上。
 
 */
-(void)BinarySearch
{
    int a[15]={12,3,4,6,98,123,3,56,78,11,65,455,324,0,1};
    int len = sizeof(a)/sizeof(a[0]);
    printArray(a, len, 0);
    int i;
    int first;
    int last;
    int iSave;
    
    for(i=1; i<len; i++)
    {
        first = 0;
        last = i - 1;
        iSave = a[i];
        
        while(first <= last)
        {
            if(a[i] >= a[(first + last)/2])
            {
                first = (first + last)/2 + 1;
            }
            else
            {
                last = (first + last)/2 - 1;
            }
        }
        
        for(int j=i-1; j>=first; j--)
        {
            /* 将排序码大于ki的记录后移 */
            a[j+1] = a[j];
        }
        
        a[first] = iSave;
    }
    
    printArray(a, len, 1);
}
















@end
