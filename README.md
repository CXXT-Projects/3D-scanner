# 3D-scanner



##  Experimental Preparation

1. 器材准备：工业相机、激光器、标定板、旋转平台、STM32、扫描物体
2. 环境搭建：固定相机、激光器、旋转平台的相对位置保持不变
3. 软件支持：MATLAB Image Acquisition Tool及对应的adaptor、MATLAB Camera Calibration Toolbox、MindVision软件

 	## Quick Start

### 确定激光平面

- 通过计算机控制工业相机，设置相机参数，进行图像采集。工业相机连接到装有驱动的电脑中，使用 MATLAB 的Image Acquisition Tool（注意：需要安装Image Acquisition Toolbox Support Package for OS Generic Video Interface），拍摄无激光照射下的**棋盘格**（标定板）图片。需要拍摄正常、左偏、右偏、上偏、下偏、远、近共7张图片，并保存在本地。
- 使用MindVision软件拍摄使用有激光照射下棋盘格（标定板）图片，要求相机、激光器位置不变，标定板的七个位置也与无激光标定时的相同，激光面竖直打在标定板上。改变曝光时间的大小，确保激光照射下白色格子的激光线不能太粗，我们取相机曝光时间为1ms，使得图像中的激光线尽可能最细，便于之后确定一条单一直线。
- 使用 MATLAB 的Camera Calibration Toolbox进行相机标定。
- 使用 Camera Calibration Toolbox 对带激光的图片进行去畸变。
- 把去畸变的图片进行mask操作。



### 确定轴线



### 物体扫描

- 拍摄图像并自动化保存（image.bmp）

  调用下方函数，进入debug模式，在循环下的第一行打断点，配合转台舵机，每转一次就运行一次代码

  ```matlab
  % img_num 拍摄图像的数量
  
  auto_read_img(img_num)
  ```



- 图像去畸变（image.bmp → image_rect.bmp）

  下载MATLAB的*Camera Calibration Toolbox*

  下载地址：http://www.vision.caltech.edu/bouguetj/calib_doc/index.html#links

  在图像保存文件夹下，命令行输入calib，选择Standard模式，点击Load加载`Calib_Results.mat`，点击Image names输入图像头文字，点击Read images读取所有图像，点击Undistort image去畸变并导出去畸变完成后的图像。

  

- 图像mask处理（image_rect.bmp → image_mask.bmp）

  ```matlab
  % img_num 需要处理的图像的数量
  % img_name 保存的图像的文件名
  % y_max mask的最大的y值，即mask是x:[1 1280], y:[1,y_max]范围为1，其余为0的1280*1024矩阵
  
  rect2mask_bmp(img_num,img_name,y_max)
  ```

  

- 在`./CameraCalibration/scripts/` 文件夹中复制`Calib_Results.mat` , `c_c_results.mat`到 `scripts` 文件夹中，其中`Calib_Results.mat`是相机标定的结果，`c_c_results.mat`是确定激光平面所用到的点云数据。

  

- 在`./examples/Scripts/`复制所有的文件至`scripts`文件夹中。

  

- 二值化操作

  ```matlab
  % threshold 阈值大小
  % input_num 需要处理的图片数量
  % input_file_name 处理的图片的文件名
  % output_file_name 输出的图片文件名
  
  image_thresh(threshold, input_num, input_file_name, output_file_name)
  ```

  

- (u, v) 点取平均

  ```matlab
  % input_num 需要处理的图片数量
  % input_filename 处理的图片的文件名
  % output_filename 输出的mat文件名
  
  image_thresh_average(input_num, input_filename, output_filename)
  ```

  

- 计算真实相机坐标系下的坐标点

  ```matlab
  % image_num 需要处理的图片数量
  % output_file_name 输出结果文件名(文件格式: .mat)
  
  calc_true_camera_coordinates(image_num, output_file_name)
  ```

  

- 把相机坐标系下的点移到轴线坐标系下

  ```matlab
  % t 平移矩阵
  % input_file_name 相机坐标系下的点mat文件
  % input_num 需要处理的图片数量
  % output_file_name 输出结果文件名(文件格式: .mat)
  
  cc_points_offset(t, input_file_name, input_num, output_file_name)
  ```

  

- 把轴线坐标系下的点进行旋转

  ```matlab
  % input_num 需要处理的图片数量
  % input_file_name 
  % r 轴线的方向向量
  % output_file_name 输出结果文件名(文件格式: .mat)
  
  cc_rotate(input_num, input_file_name, r, output_file_name)
  ```

  

- 点云的结果

  ```matlab
  >> [X, Y, Z]  = get_all_camera_coordinate(image_num, results_file_path)
  >> plot3(X, Y, Z, 'r.'); hold on; axis equal;
  ```

  ![image.png](https://i.loli.net/2019/12/31/eSULa18slkEoQ7n.png)

  

